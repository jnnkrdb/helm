{{/*
Expand the name of the chart.
*/}}
{{- define "applicationsetcontroller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "applicationsetcontroller.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "applicationsetcontroller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "applicationsetcontroller.labels" -}}
helm.sh/chart: {{ include "applicationsetcontroller.chart" . }}
{{ include "applicationsetcontroller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
helm.sh/version: {{  .Chart.AppVersion | quote }}
{{- end }}
helm.sh/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "applicationsetcontroller.selectorLabels" -}}
helm.sh/name: {{ include "applicationsetcontroller.name" . }}
helm.sh/instance: {{ .Release.Name }}
{{- end }}
