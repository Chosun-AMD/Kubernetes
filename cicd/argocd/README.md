# ArgoCD Install Guide

```shell
kubectl create namespace argocd
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -o argo-cd.yaml
```

`웹 콘솔 접속을 위해 argocd-server의 Service 타입을 ClusterIP에서 NodePort로 변경해
클러스터 외부에서 접근할 수 있게 하기 위해 Load Balancer 대선 Node Port를 사용한다.`

### 15657 라인 기준 `type: NodePort`로 수정
```yaml
---
apiVersion: v1
kind: Service 
metadata:
  labels: 
    app.kubernetes.io/component: server
    app.kubernetes.io/name: argocd-server
    app.kubernetes.io/part-of: argocd
  name: argocd-server
spec:
  type: NodePort
  ports:  
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
  - name: https
    port: 443
    protocol: TCP
    targetPort: 8080
  selector:
    app.kubernetes.io/name: argocd-server
---
```


# 2. ArgoCD CLI 설치
```shell
VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
echo $VERSION
```

확인한 버전을 아래의 $VERSION에 적어준다.
```shellcurl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod +x /usr/local/bin/argocd
```

# 3. ArgoCD 배포
```shell
kubectl apply -n argocd -f argo-cd.yaml
```

# 4. Login
Initial ID : admin
Initial PW : ```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo```
