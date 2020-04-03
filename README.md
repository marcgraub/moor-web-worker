# Moor web worker

An app to test the [moor](https://github.com/simolus3/moor) library with Web Workers.

Execute with:
```
webdev serve --auto restart --release -- --define='build_web_compilers|entrypoint=dart2js_args=["-DUSE_WORKER=true"]'
```