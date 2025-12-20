### Print files which match *.txt and are of size zero
> $ find . -name '*.txt' -size 0


### Compress a folder with tar
> tar -cJf archiveFileName.tar.xz directoryName

`- c` => Create a new tar archive
`- J` => Use the xz compression by calling the xz command
`- f` => Archive name
