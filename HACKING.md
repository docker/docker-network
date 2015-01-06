Add vendored packages
=====================

For updating vendored package you need docker-network in your `GOPATH`. It's
probably better to use clean `GOPATH` to avoid interfering with forks and other
projects. Below we will suppose, that `GOPATH` environment variable is set.

Also you need `godep` tool:
```
go get github.com/tools/godep
```

* Move to docker-network directory:
```
cd $GOPATH/src/github.com/docker/docker-network
```

* Restore packages from `Godeps/Godeps.json`:
```
godep restore
```

* Edit code to use new package

* `go get` new package:
```
go get github.com/example/example
```

* Move to new package directory:
```
$GOPATH/src/github.com/example/example
```

* Checkout the desired version:
```
git checkout v1.0.0
```

* Move to docker-network directory again:
```
cd $GOPATH/src/github.com/docker/docker-network
```

* Save it in your project and rewrite imports:
```
godep save -r ./...
```

Update vendored packages
========================

Same as add, but you don't need to `go get` package and need to do:
```
godep update github.com/example/example
```
before `godep save`.

> **Warning**:
> You should check that you updated only desired package after save.
