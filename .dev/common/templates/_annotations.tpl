
{{/*
Integrate the default annotations with the default flags.
Usage:
  {{- include "common.annotations.default" . }}  
*/}}
{{- define "common.annotations.default" -}}
jnnkrdb.de/source: "github.com/jnnkrdb/helm"
{{- end -}}


{{/*
Append all received annotations from the listed items.
Usage:
  {{- include "common.annotations" ( dict "annotations" (list .Values.global.annotations, .Values.annotations, .Values.pod.annotations) ) }}  
*/}}
{{- define "common.annotations" }}
{{- include "common.annotations.default" . }}
{{- range .annotations }}
{{- if . }}
{{ . | toYaml }}
{{- end }}
{{- end }}
{{- end }}
