
{{/*
Return the storageClass for the configured persistence solution. Can be overriden by the globals section.
{{ include "common.storage.class" ( dict "pvc" .Values.path.to.persistence  "global" .Values.global) }}
*/}}
{{- define "common.storage.class" -}}  
{{- if or .pvc.storageClass ((.global).storageClass) -}}
storageClassName: {{ default .pvc.storageClass ((.global).storageClass) | quote }}
{{- end -}}
{{- end -}}
