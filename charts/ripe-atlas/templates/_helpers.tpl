{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper image name
*/}}
{{- define "atlas.image" -}}
{{- $imageRoot := .Values.image -}}
{{- if not .Values.image.tag }}
  {{- $tag := (dict "tag" .Chart.AppVersion) -}}
  {{- $imageRoot := merge .Values.image $tag -}}
{{- end -}}
{{- include "common.images.image" (dict "imageRoot" $imageRoot "global" .Values.global) -}}
{{- end -}}
