
{{/*
Return the ingressClass for the configured ingress. Can be overriden by the globals section.
{{ include "saab.common.ingress.className" ( dict "ing" .Values.path.to.ingress  "global" .Values.global) }}
*/}}
{{- define "common.ingress.className" -}}  
{{- if or .ing.className ((.global).ingressClassName) -}}
ingressClassName: {{ default .ing.className ((.global).ingressClassName) | quote }}
{{- end -}}
{{- end -}}
