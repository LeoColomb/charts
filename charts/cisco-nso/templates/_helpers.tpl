{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper image name
*/}}
{{- define "nso.image" -}}
{{- $imageRoot := .Values.image -}}
{{- if not .Values.image.tag }}
    {{- $tag := (dict "tag" .Chart.AppVersion) -}}
    {{- $imageRoot := merge .Values.image $tag -}}
{{- end -}}
{{- include "common.images.image" (dict "imageRoot" $imageRoot "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper image name (for the packages artifact image)
*/}}
{{- define "nso.packages.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.packages.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "nso.volumePermissions.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.volumePermissions.image "global" .Values.global) }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "nso.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{/*
Return the proper Backups PVC name
*/}}
{{- define "nso.backups.pvc.name" -}}
{{- if .Values.backups.pvc.existingClaim -}}
    {{- printf "%s" (tpl .Values.backups.pvc.existingClaim $) | trunc 63 | trimSuffix "-" -}}
{{/*- else if .Values.startFromBackup.existingClaim -}}
    {{- printf "%s" (tpl .Values.startFromBackup.existingClaim $) | trunc 63 | trimSuffix "-" -*/}}
{{- else -}}
    {{- printf "%s-backups" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}
