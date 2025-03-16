def "nu-complete dotnet nuget sources" [] {
     ^cat ~/AppData/Roaming/NuGet/NuGet.Config | from xml | get content | where tag == "packageSources" | get content | each { get attributes.key } | flatten | each { |line| $"\"($line | str trim)\""  } 
}

def "nu-complete dotnet projectOrSolution path" [] {
  ^ls . |  select name | rename value 
}

def dotnet_verbosity [] {
  ["q","m","n","d","diag"]
}

def dotnet_runtime_identifiers [] {
  ["win-x64", "win-x84", "win-arm64", "linux-x64", "linux-arm64", "osx-x64", "osx-arm64"]
}

def dotnet_architeture_identifiers [] {
  ["x64", "x86"]
}


# .NET dependency restorer
export extern "dotnet restore" [
  --disable-build-servers                # Force the command to ignore any persistent build servers.
  --source(-s):string@"nu-complete dotnet nuget sources"                 # The NuGet package source to use for the restore.
  --packages:string                      # The directory to restore packages to.
  --use-current-runtime                  # Use current runtime as the target runtime.
  --ucr                                  # Use current runtime as the target runtime.
  --disable-parallel                     # Prevent restoring multiple projects in parallel.
  --configfile:path                    # The NuGet configuration file to use.
  --no-http-cache                        # Disable Http Caching for packages.
  --ignore-failed-sources                # Treat package source failures as warnings.
  --force(-f)                            # Force all dependencies to be resolved even if the last restore was successful.
  --runtime(-r):string@dotnet_runtime_identifiers                   # The target runtime to restore packages for.
  --no-dependencies                      # Do not restore project-to-project references and only restore the specified project.
  --verbosity(-v):string@dotnet_verbosity # Set the MSBuild verbosity level. Allowed values are q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic].
  --interactive                          # Allows the command to stop and wait for user input or action (for example to complete authentication).
  --artifacts-path:path                # The artifacts path. All output from the project, including build, publish, and pack output, will go in subfolders under the specified path.
  --use-lock-file                        # Enables project lock file to be generated and used with restore.
  --locked-mode                          # Don't allow updating project lock file.
  --lock-file-path:path                # Output location where project lock file is written. By default, this is 'PROJECT_ROOT\packages.lock.json'.
  --force-evaluate                       # Forces restore to reevaluate all dependencies even if a lock file already exists.
  --arch(-a):string@dotnet_architeture_identifiers                      # The target architecture.
  --help(-h)                             # Show command line help.
  PROJECT_OR_SOLUTION?:path             # The project or solution file to operate on. If a file is not specified, the command will search the current directory for one.
]


def dotnet_configuration_identifiers [] {
  ["Debug", "Release"]
}

def dotnet_os_identifiers [] {
  ["linux", "unix", "maccatalyst", "win"]
}

def dotnet_framework_identifiers [] {
  [
    "netcoreapp1.0","netcoreapp1.1", "netcoreapp2.0", "netcoreapp2.1", "netcoreapp3.0", "netcoreapp3.1", "net5.0","net6.0","net7.0","net8.0","net9.0",
    "netstandard1.0", "netstandard1.1", "netstandard1.2", "netstandard1.3", "netstandard1.4","netstandard1.5","netstandard1.6","netstandard2.0","netstandard2.1",
    "net481", "net48", "net472", "net471", "net47", "net462", "net461", "net46"
  ]
}

# .NET Builder
export extern "dotnet build" [
  --use-current-runtime                 # Use current runtime as the target runtime.
  --ucr                                 # Use current runtime as the target runtime.
  --framework(-f):string@dotnet_framework_identifiers                # The target framework to build for. The target framework must also be specified in the project file.
  --configuration(-c):string@dotnet_configuration_identifiers            # The configuration to use for building the project. The default for most projects is 'Debug'.
  --runtime(-r):string@dotnet_runtime_identifiers                  # The target runtime to build for.
  --version-suffix:string               # Set the value of the $(VersionSuffix) property to use when building the project.
  --no-restore                          # Do not restore the project before building.
  --interactive                         # Allows the command to stop and wait for user input or action (for example to complete authentication).
  --verbosity(-v):string@dotnet_verbosity # Set the MSBuild verbosity level. Allowed values are q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic].
  --debug                               # Enable debug mode for the build.
  --output(-o):path                   # The output directory to place built artifacts in.
  --artifacts-path:path               # The artifacts path. All output from the project, including build, publish, and pack output, will go in subfolders under the specified path.
  --no-incremental                      # Do not use incremental building.
  --no-dependencies                     # Do not build project-to-project references and only build the specified project.
  --nologo                              # Do not display the startup banner or the copyright message.
  --self-contained                 # Publish the .NET runtime with your application so the runtime doesn't need to be installed on the target machine.
  --sc                 # Publish the .NET runtime with your application so the runtime doesn't need to be installed on the target machine.
  --no-self-contained                   # Publish your application as a framework-dependent application. A compatible .NET runtime must be installed on the target machine to run your application.
  --arch(-a):string@dotnet_architeture_identifiers                     # The target architecture.
  --os:string@dotnet_os_identifiers                           # The target operating system.
  --disable-build-servers               # Force the command to ignore any persistent build servers.
  --help(-h)                            # Show command line help.
  PROJECT_OR_SOLUTION?:string            # The project or solution file to operate on. If a file is not specified, the command will search the current directory for one.
]


# .NET Clean Command
export extern "dotnet clean" [
  --framework(-f):string@dotnet_framework_identifiers          # The target framework to clean for. The target framework must also be specified in the project file.
  --runtime(-r):string@dotnet_runtime_identifiers             # The target runtime to clean for.
  --configuration(-c):string@dotnet_configuration_identifiers # The configuration to clean for. The default for most projects is 'Debug'.
  --interactive                                               # Allows the command to stop and wait for user input or action (for example to complete authentication).
  --verbosity(-v):string@dotnet_verbosity                     # Set the MSBuild verbosity level. Allowed values are q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic].
  --output(-o):path                                           # The directory containing the build artifacts to clean.
  --artifacts-path:path                                       # The artifacts path. All output from the project, including build, publish, and pack output, will go in subfolders under the specified path.
  --nologo                                                   # Do not display the startup banner or the copyright message.
  --disable-build-servers                                    # Force the command to ignore any persistent build servers.
  --help(-h)                                                # Show command line help.
projectOrSolution?:path                                                # The project or solution file to operate on. If a file is not specified, the command will search the current directory for one.
]
