# OpenCode Update Script
# Pulls the latest Windows release from OpenCode GitHub, decompresses it, and installs it

export def opencode-update [] {
    let temp_dir = $env.TEMP | path join "opencode-update"
    let target_path = "C:\\tools\\other-tools\\opencode.exe"
    
    # Create temp directory
    print "Creating temporary directory..."
    mkdir $temp_dir
    
    # Get latest release info from GitHub API
    print "Fetching latest OpenCode release..."
    let release_info = http get "https://api.github.com/repos/sst/opencode/releases/latest"
    
    # Find the Windows asset, excluding baseline version
    let windows_asset = $release_info.assets 
        | where { $in.name == "opencode-windows-x64.zip" }
        | first
    
    if ($windows_asset | is-empty) {
        rm --recursive --force $temp_dir
        error make {
            msg: "No Windows release found"
            label: {
                text: "Could not find opencode-windows-x64.zip in the latest release"
            }
        }
    }
    
    let download_url = $windows_asset.browser_download_url
    let file_name = $windows_asset.name
    let temp_file = $temp_dir | path join $file_name
    
    # Stop any running OpenCode processes
    try {
        print "Stopping any running OpenCode instances..."
        powershell -NoProfile -Command "Get-Process -Name opencode -ErrorAction SilentlyContinue | Stop-Process -Force"
    } catch {
        # Ignore if no process is running
    }
    
    # Download the release
    print $"Downloading ($file_name)..."
    http get $download_url | save --force $temp_file
    
    # Check if it's a zip file and decompress if needed
    if ($file_name =~ "\\.zip$") {
        print "Decompressing zip file..."
        let extract_dir = $temp_dir | path join "extracted"
        mkdir $extract_dir
        
        # Using PowerShell to extract zip
        powershell -NoProfile -Command $"Expand-Archive -Path '($temp_file)' -DestinationPath '($extract_dir)' -Force"
        
        # Find the exe in the extracted directory
        let exe_files = (ls $extract_dir --all 
            | where { $in.type == "file" and ($in.name | str ends-with ".exe") })
        
        let exe_file = if ($exe_files | is-empty) {
            null
        } else {
            ($exe_files | first).name
        }
        
        if ($exe_file | is-empty) {
            rm --recursive --force $temp_dir
            error make {
                msg: "No executable found in archive"
                label: {
                    text: "Could not find .exe file in the decompressed archive"
                }
            }
        }
        
        cp --force $exe_file $target_path
    } else {
        # If it's already an exe, just copy it
        cp --force $temp_file $target_path
    }
    
    print $"✓ OpenCode updated successfully at ($target_path)"
    print $"Release: ($release_info.tag_name)"
    
    # Cleanup temp directory
    print "Cleaning up temporary files..."
    rm --recursive --force $temp_dir
}
