### LogChimp
https://github.com/logchimp/logchimp

#### Installing the Chart

To install the chart with the release name `my-release` in `logchimp` namespace:

```console
## Create the namespace where you want to install the chart
$ kubectl create namespace logchimp

## Install the logchimo helm chart
$ helm install my-release --namespace logchimp ./
```

#### Upgrading the Chart
```console
$ helm upgrade my-release --namespace logchimp ./
```

#### Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --namespace logchimp
```
