### LogChimp
https://github.com/logchimp/logchimp

#### Installing the Chart

To install the chart with the release name `logchimp` in `logchimp` namespace:

```console
## Create the namespace where you want to install the chart
$ kubectl create namespace logchimp

## Install the logchimo helm chart
$ helm install logchimp --namespace logchimp ./
```

#### Upgrading the Chart
```console
$ helm upgrade logchimp --namespace logchimp ./
```

#### Uninstalling the Chart

To uninstall/delete the `logchimp` deployment:

```console
$ helm delete logchimp --namespace logchimp
```
