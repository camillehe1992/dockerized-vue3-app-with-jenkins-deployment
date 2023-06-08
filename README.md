# sample-vue-app-with-cicd

A sample Vue application for demonstrate CICD using Jenkinsfile and Dockerfile

## Scaffolding Project

```bash
npm create vite@latest sample-vue-app-with-cicd -- --template vue

cd sample-vue-app-with-cicd

npm install
npm run dev
```

## Useful Commands

```bash
# lint source code
npm run lint

# run unit test
npm run test:unit
```

## Dockerizing Project

```bash
# build the docker image
docker build -t sample-vue-app-with-cicd .

# run the application in a Docker conatainer
docker run -it -p 8080:8080 --rm --name dockerize-vuejs-app-1 sample-vue-app-with-cicd
```

We should be able to access our Vue.js app on http://localhost:8080.

## References

- https://vitejs.dev/guide/
- https://www.robinwieruch.de/vite-eslint/
- https://www.middlewareinventory.com/blog/docker-vuejs/
- https://devpress.csdn.net/vue/62f0d0c4c6770329307f48f2.html#devmenu8
- https://eslint.vuejs.org/user-guide/
- https://docs.docker.com/engine/reference/commandline/push/
