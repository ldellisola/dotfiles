# export def open [file: string] {
#   start $file
# }

export def terminal [path?: string] {
  if ($path == null) {
    wt.exe
  } else {
    wt.exe -d $path
  }
}

export def rider [path?: string] {
  let rider_exe = (
    ls "C:\\Program Files (x86)\\JetBrains"
    | where name =~ "JetBrains Rider"
    | sort --natural   
    | first 
    | get name
    | each { |line| path join $line "bin" "rider64.exe" }
  )
  if $path == null {
    job spawn {
      ^$rider_exe
    }
  } else {
    job spawn {
    ^$rider_exe $path
    }
  }
}



