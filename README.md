# GitHub Actions를 사용한 CI/CD

GitHub Actions는 빌드, 테스트 및 배포 파이프라인을 자동화할 수 있는 CI/CD 플랫폼이다.

- 리포지토리에서 어던 이벤트가 발생했을 때 특정 작업이 일어나게 하거나 주기적으로 어떤 작업들을 반복해서 실행시킬 수 있다.
- 모든 pull request 요청을 빌드 및 테스트하거나 merge pull request 요청을 배포하는 워크플로우를 만들 수 있다.

### (1) 지속적인 통합 (Continuous Intergration, CI)

개발자들이 변경한 코드가 공동 저장소에 자주 통합되는 개발 방식을 의미한다.

- 코드 변경 사항을 빠르게 감지하고 문제를 조기에 해결하여 통합된 코드의 품질을 높이는 것이다.

### (2) 지속적인 배포 (Continuous Delivery or Continuous Deployment, CD)

두 가지 방식으로 구분할 수 있다.

#### 지속적인 서비스 제공 (Continuous Delivery)

코드가 개발 환경을 거쳐 실제 배포 가능한 상태로 자동화된 테스트와 승인 프로세스를 통해 준비되는 것을 의미한다.

- 배포 전 테스트 및 품질 검증이 자동으로 이루어지며 배포 준비가 완료된 상태로 유지된다. 
- 팀이 원하는 시점에 수동으로 배포할 수 있다.
- 배포 주기를 짧게 가져가면서도 안정성을 높이는 데 중점을 둔다.

#### 지속적인 배포 (Continuous Deployment)

CI와 CD의 모든 과정이 완전히 자동화되어 코드가 통합되면 모든 테스트를 통과한 후 즉시 운영 환경에 배포되는 방식이다.

- 모든 테스트와 검증을 자동화하여 코드 변경이 있으면 즉시 운영 환경에 배포된다.
- 빠른 피드백을 통해 새로운 기능이나 변경 사항이 즉각적으로 사용자에게 제공된다.
- 지속적인 배포를 통해 제품의 개선 사항을 빠르게 사용자에게 전달할 수 있다.

## GitHub Actions 구성 요소

### 1) Workflows

WorkFlows는 하나 이상의 작업을 실행할 구성 가능한 자동화된 프로세스다.

- 리포지토리의 이벤트로 트리거될 때 실행되거나 수동으로 또는 정의된 일정에 따라 트리거될 수 있다.
- 리포지토리의 `.github/workflows` 디렉토리에 정의되며 각각 다른 작업을 수행하는 여러 Workflows를 가질 수 있다.
- YAML 파일에서 정의된다.

### 2) Events

Events는 Workflows 실행을 트리거하는 리포지토리의 특정 활동이다.

- 누군가가 pull request 요청을 만들거나 issue를 열거나 리포지토리에 commit을 push할 때 활동이 시작될 수 있다.

### 3) Steps

Steps는 Jobs 안에서 순차적으로 실행되는 개별 작업이다.

- GitHub Actions에서는 각 Jobs가 하나 이상의 Steps로 이루어져 있다.
- Steps는 단순한 커맨드 또는 스크립트가 될 수도 있고 Actions가 될 수도 있다.
  - 커맨드나 스크립트를 실행할 때는 `run` 속성을 사용하고 Actions를 실행할 때는 `uses` 속성을 사용한다.

### 4) Jobs

Jobs는 동일한 Runners에서 실행되는 Workflows의 Steps 집합이다.

- 각 Steps 실행되는 셸 스크립트 또는 실행되는 Jobs이다.
- Steps 순서대로 실행되며 서로 종속된다. 각 Steps 동일한 Runners에서 실행되므로 Steps 간 데이터를 공유할 수 있다.
  - 예를 들어 애플리케이션을 빌드하는 Steps 뒤에 빌드된 애플리케이션을 테스트하는 Steps가 있을 수 있다.
- Jobs간 종속성을 구성할 수 있으며 기본적으로 Jobs는 종속성이 없고 병렬로 실행된다.
  - Jobs가 다른 Jobs에 종속되면 Jobs는 실행하기 전에 족송 Jobs가 완료되기를 기다린다.

### 5) Actions

Actions는 Steps에서 실행되는 재사용 가능한 코드 조각이다.

- 하나의 리포지토리 범위 내에서 여러 Workflows 간에서 공유 할 수 있다.
- 공개 코드 저장소를 통해 Actions를 공유하면 GitHub 상의 모든 코드 저장소에서 사용할 수 있다.

### 6) Runners

Runners는 트리거될 때 Workflows를 실행하는 서버이다.

- 각 실행자는 한 번에 하나의 Jobs를 실행할 수 있다.
- GitHub는 Workflows를 실행할 Unbuntu Linux, Microsoft Windows, macOS 실행기를 제공한다.

## 참고

- https://docs.github.com/ko/actions/about-github-actions/understanding-github-actions