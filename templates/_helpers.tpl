{{/*
Expand the name of the chart.
*/}}
{{- define "logchimp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "logchimp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-server" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "logchimp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "logchimp.labels" -}}
helm.sh/chart: {{ include "logchimp.chart" . }}
{{ include "logchimp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "logchimp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "logchimp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
LogChimp Secret Key
*/}}
{{- define "logchimp.secretKey" -}}
{{- $secret := (lookup "v1" "Secret" .Release.Namespace (printf "%s-key" (include "logchimp.fullname" .))) -}}
{{- if $secret -}}
{{/* 
   Reusing current secretKey since secret exists
*/}}
{{-  $secret.data.key -}}
{{- else -}}
{{/* 
    Generate new secretKey
*/}}
{{- (randAlpha 12) | b64enc | quote -}}
{{- end -}}
{{- end -}}
