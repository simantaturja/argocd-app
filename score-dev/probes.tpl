{{ range $i, $m := .Manifests }}
{{ if eq $m.kind "Deployment" }}
{{ range $cname, $_ := $m.spec.template.spec.containers }}
- op: set
  path: {{ $i }}.spec.template.spec.containers.{{ $cname }}.startupProbe
  value:
    httpGet:
      path: /status
      port: 8080 
    initialDelaySeconds: 15
    failureThreshold: 20
    periodSeconds: 5
    timeoutSeconds: 5
- op: set
  path: {{ $i }}.spec.template.spec.containers.{{ $cname }}.livenessProbe
  value:
    httpGet:
      path: /status
      port: 8080 
    initialDelaySeconds: 15
    failureThreshold: 20
    periodSeconds: 5
    timeoutSeconds: 5
{{ end }}
{{ end }}
{{ end }}
