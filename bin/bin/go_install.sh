VERSION=$1
go install golang.org/dl/go${VERSION}@latest
go${VERSION} download
