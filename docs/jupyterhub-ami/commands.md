## List Python packages

```
/opt/python/3.8/bin/pip freeze | grep -E 'pkg1|pkg2|...'
```

## List R packages

```
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip
```
