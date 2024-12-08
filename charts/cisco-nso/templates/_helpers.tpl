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
Return the proper image name (for the CLI containers image)
*/}}
{{- define "nso.cli.image" -}}
{{- if .Values.cli.image.repository -}}
  {{- include "common.images.image" (dict "imageRoot" .Values.cli.image "global" .Values.global) }}
{{- else -}}
  {{- include "nso.image" . }}
{{- end -}}
{{- end -}}

{{/*
Return the proper image name (for the backups cronjob image)
*/}}
{{- define "nso.backupsCronJob.image" -}}
{{- if .Values.backups.cronjob.image.repository -}}
  {{- include "common.images.image" (dict "imageRoot" .Values.backups.cronjob.image "global" .Values.global) }}
{{- else -}}
  {{- include "nso.image" . }}
{{- end -}}
{{- end -}}

{{/*
Return the proper image name (for the backups restore image)
*/}}
{{- define "nso.restoreBackup.image" -}}
{{- if .Values.restoreFromBackup.image.repository -}}
  {{- include "common.images.image" (dict "imageRoot" .Values.restoreFromBackup.image "global" .Values.global) }}
{{- else -}}
  {{- include "nso.image" . }}
{{- end -}}
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
Return the proper PVC name
*/}}
{{- define "nso.run.pvc.name" -}}
{{- if and .Values.persistence.enabled .Values.persistence.existingClaim -}}
  {{- printf "%s" (tpl .Values.persistence.existingClaim $) | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- printf "%s-run" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{/*
Return the proper Backups PVC name
*/}}
{{- define "nso.backups.pvc.name" -}}
{{- if .Values.backups.pvc.existingClaim -}}
  {{- printf "%s" (tpl .Values.backups.pvc.existingClaim $) | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- printf "%s-backups" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}
