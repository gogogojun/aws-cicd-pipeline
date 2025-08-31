AWS CI/CD Pipeline
📖 프로젝트 설명

Terraform을 이용해 AWS CodePipeline 기반 CI/CD 파이프라인을 구현한 프로젝트입니다.
GitHub 저장소와 연동하여 코드 변경 시 자동으로 Plan → Apply 단계가 실행되도록 구성했습니다.

🛠️ 사용 서비스 및 구성

CodePipeline

Source: GitHub (CodeStar Connection)

Build/Deploy: CodeBuild (Terraform 실행)

S3

Terraform backend (tfstate 저장)

Pipeline Artifacts 저장

IAM

CodePipeline 및 CodeBuild 전용 Role/Policy

Terraform

plan-buildspec.yml, apply-buildspec.yml 기반으로 IaC 실행

📂 주요 구조
aws-cicd-pipeline/
├── buildspec/
│   ├── apply-buildspec.yml
│   └── plan-buildspec.yml
├── iam.tf
├── s3.tf
├── state.tf
├── variables.tf
└── pipeline.tf

✅ 실행 결과

GitHub에 Push → CodePipeline 자동 실행

Terraform plan → apply 단계 정상 수행

테스트 파일 추가 시 자동 배포 확인 완료
