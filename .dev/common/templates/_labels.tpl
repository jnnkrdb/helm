{{/*
Append all received labels from the listed items.
Usage:
  {{- include "common.labels" ( dict "labels" (list .Values.global.labels .Values.labels, .Values.pod.labels) ) }}  
*/}}
{{- define "common.labels" }}
{{- range .labels }}
{{- if . }}
{{ . | toYaml }}
{{- end }}
{{- end }}
{{- end }}
