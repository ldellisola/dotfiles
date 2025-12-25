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





