# Buildkite agent

A [Buildkite](https://buildkite.com/) agent is described as a build runner process used for automation pipelines. It
essentially polls data from its repository and runs the defined steps specified in the given pipeline.

## Install

Run the following instructions in the same order to have it installed:

```bash
$ cd kubernetes/services/buildkite-agent
$ kubectl apply -f sa.yaml
$ kubectl apply -f secrets.yaml
$ kubectl apply -f deployment.yaml
```

## License

[GPLv3](LICENSE) license
