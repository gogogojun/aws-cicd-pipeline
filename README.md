# AWS CI/CD Pipeline with Terraform

## 📖 프로젝트 개요
이 프로젝트는 **Terraform**을 활용하여 AWS 상에 **CI/CD 파이프라인**을 자동 구축한 예제입니다.  
GitHub 저장소에 코드를 푸시하면, **CodePipeline → CodeBuild → Terraform** 흐름을 통해  
인프라 코드가 자동으로 검증/배포됩니다.

---

## 🛠️ 사용 서비스 및 구성
- **AWS CodePipeline**
  - Source: GitHub (CodeStar Connection)
  - Build/Deploy: CodeBuild (Terraform Plan / Apply)
- **AWS S3**
  - Terraform backend (tfstate 저장)
  - Pipeline Artifact 저장
- **AWS IAM**
  - CodePipeline / CodeBuild 전용 IAM Role + Policy
- **Terraform**
  - IaC(Infrastructure as Code) 기반으로 파이프라인 정의

---

## 📂 폴더 구조
```plaintext
aws-cicd-pipeline/
├── buildspec/
│   ├── apply-buildspec.yml   # terraform apply 실행
│   └── plan-buildspec.yml    # terraform plan 실행
├── iam.tf                    # IAM Role 및 Policy 정의
├── s3.tf                     # S3 backend 및 artifact bucket 정의
├── state.tf                  # Terraform backend 설정
├── variables.tf              # 변수 정의
└── pipeline.tf               # CodePipeline / CodeBuild 구성
---
---
## ⚙️ 동작 흐름
1. GitHub `main` 브랜치에 코드 푸시  
2. CodePipeline이 Source 단계에서 Terraform 코드를 S3 Artifact로 저장  
3. Build 단계(CodeBuild)가 `terraform plan` 실행  
4. Deploy 단계(CodeBuild)가 `terraform apply` 실행  
5. 결과는 CloudWatch Logs 및 AWS 콘솔에서 확인 가능

---

## ✅ 실행 결과
- GitHub 커밋 → CodePipeline 자동 실행 확인
- 테스트 파일 추가 시 자동 빌드/배포 완료
- Terraform 리소스 정상 생성 및 반영
