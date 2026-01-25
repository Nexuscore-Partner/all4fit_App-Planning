# 📑 All4Fit (모두의핏) | PM

> **"모두를 위한 운동, 모두의핏"**  
> 아이디어 구상부터 서비스 런칭까지, PM으로서 제품의 전체 생애주기를 기획하고 관리한 프로젝트입니다.

![Figma](https://img.shields.io/badge/Figma-Design%20System-F24E1E?logo=figma&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-Mobile%20App-02569B?logo=flutter)
![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?logo=supabase&logoColor=white)
![PM](https://img.shields.io/badge/Role-Product%20Manager-blue)

---

## 🎨 Service Journey: 기획에서 서비스까지

| **1. 문제 정의** | **2. 기획 & 설계** | **3. 화면 설계** | **4. 개발 협업** |
|:---:|:---:|:---:|:---:|
| *사용자 리서치 & 페르소나* | *PRD, API 명세, IA* | *Figma 와이어프레임* | *개발팀과 소통 & QA* |

| **1. 화면 기획서** | **2. 디자인 시스템** | **3. 랜딩 페이지** | **4. 앱 화면** |
| :---: | :---: | :---: | :---: |
| <img src="images/readme/wireframe.png" width="200" alt="Wireframe"> | <img src="images/readme/design-system.png" width="200" alt="Design System"> | <img src="images/readme/web-preview.jpeg" width="200" alt="Landing Page"> | <img src="images/readme/app-combined.png" width="200" alt="App Screen"> |
| *UX 흐름 및 와이어프레임* | *Figma 디자인 시스템* | *[all4fit.co.kr](https://all4fit.co.kr)* | *iOS/Android 실서비스* |

---

## 👥 Meet the Team (NEXUSCORE)

본 프로젝트의 기획 및 PM을 담당한 핵심 인력입니다.

| **Lead PM / Strategy** | **Product Manager / Design** |
| :---: | :---: |
| <p align="center"><img src="https://avatars.githubusercontent.com/jinseok19" width="100" height="100" style="border-radius: 5%;"></p><p align="center"><a href="https://github.com/jinseok19"><img src="https://img.shields.io/badge/jinseok19-181717?style=for-the-social&logo=github&logoColor=white"/></a></p> | <p align="center"><img src="https://avatars.githubusercontent.com/hwruchan" width="100" height="100" style="border-radius: 5%;"></p><p align="center"><a href="https://github.com/hwruchan"><img src="https://img.shields.io/badge/hwruchan-181717?style=for-the-social&logo=github&logoColor=white"/></a></p> |
| **김진석 (Kim Jin-seok)** | **김정찬 (Kim Jeong-chan)** |
| 프로젝트 총괄 및 전략 기획 | 서비스 기획 및 UI/UX 설계 |

---

## 📌 Context: 왜 이 서비스를 만들었는가?

### 문제 정의
기존 운동 시설 정보는 네이버, 카카오맵 등에 **파편화**되어 있고, **시설 운영자와 지도자의 관점은 소외**되어 있습니다.

**Pain Points:**
- 🔍 **사용자**: 근처 시설을 찾기 어렵고, 신뢰할 수 있는 리뷰 부족
- 📊 **시설 운영자**: 고객 관리 수단이 없고, 온라인 홍보 어려움
- 👨‍🏫 **지도자**: 자신을 알릴 플랫폼 부재, 매칭 시스템 부족

### 솔루션
모두의 핏은 **4개 역할(일반/운영자/지도자/관리자)을 하나의 생태계로 통합**하여:
- ✅ 사용자는 지도 기반으로 시설을 검색하고 리뷰 작성
- ✅ 시설 운영자는 시설 정보 관리 및 고객 소통
- ✅ 지도자는 프로필 관리 및 매칭 서비스 제공
- ✅ 관리자는 전체 시스템 모니터링 및 운영

---

## 🎯 Core Features: 핵심 기능 (PM 관점)

### 1. 🗺️ 위치 기반 시설 검색 & 리뷰 시스템
**기획 배경**: 사용자가 '지금 여기'에서 갈 수 있는 시설을 빠르게 찾아야 함  
**구현 방식**: Kakao/Naver Maps API 연동, 거리/분야별 필터링  
**핵심 가치**: 검색 시간 단축 50%, 신뢰 리뷰로 의사결정 품질 향상

### 2. 👨‍🏫 역할 기반 아키텍처 (Multi-Role System)
**기획 배경**: 일반 사용자만이 아닌 운영자/지도자도 1급 사용자로 대우  
**구현 방식**: RBAC (Role-Based Access Control), 역할별 승인 프로세스  
**핵심 가치**: 양방향 가치 제공으로 플랫폼 생태계 구축

### 3. 💬 커뮤니티 & 지도자 매칭
**기획 배경**: 운동은 정보 공유와 동기부여가 중요한 영역  
**구현 방식**: 게시판, 1:1 문의, 매칭 알고리즘  
**핵심 가치**: 사용자 리텐션 증가, 지도자 수익 모델 확보

---

## 🛠️ Tech Stack (PM이 선정한 기술)

### Frontend
- **Mobile**: Flutter (iOS/Android 크로스 플랫폼)
  - *선정 이유*: 빠른 개발 속도, 네이티브 수준 성능

### Backend
- **BaaS**: Supabase (PostgreSQL + Auth + Storage)
  - *선정 이유*: 빠른 MVP 구축, 실시간 DB, 인증 기능 내장

### Design & PM Tools
- **Design**: Figma (Wireframe, Prototype, Design System)
- **Documentation**: Markdown, Mermaid (Flowchart)
- **Collaboration**: Discord, Notion, GitHub Projects

---

## 🎯 PM으로서 수행한 역할

### 1. Product Strategy (제품 전략)
- ✅ 1·2차 개발 범위 확정 및 MVP 기능 선정
- ✅ 사용자별 우선순위 설정 (일반 > 운영자 > 지도자)
- ✅ 3단계 로드맵 수립 (기본 기능 → 매칭 → AI 추천)

### 2. Requirement Definition (요구사항 정의)
- ✅ **PRD 작성**: 역할별 기능명세서 4개 (6,000+ 라인)
- ✅ **API 설계**: 50+ 엔드포인트 명세 작성
- ✅ **IA 설계**: 정보 구조 및 네비게이션 체계 정의

### 3. UX/UI Design Collaboration (디자인 협업)
- ✅ Figma로 와이어프레임 및 프로토타입 제작
- ✅ 디자인 시스템 구축 (컴포넌트, 컬러, 타이포그래피)
- ✅ 사용자 플로우 시각화 (회원가입, 시설 검색, 매칭 등)

### 4. Development Collaboration (개발 협업)
- ✅ 개발팀과 Discord/Notion으로 실시간 소통
- ✅ API 명세 기반 백엔드-프론트엔드 병렬 개발 지원
- ✅ QA 시나리오 작성 및 버그 트래킹

### 5. Stakeholder Management (이해관계자 관리)
- ✅ 주간 진행 상황 보고 및 리스크 관리
- ✅ 기능 우선순위 협의 및 스코프 조정
- ✅ 런칭 일정 관리 및 마일스톤 설정

---

## 📂 Repository Structure

```
모두의핏/
├── 1차개발/              # 역할별 기능명세서, API, IA, 데이터 검증
├── PM/                  # 버전별 기획 문서 아카이브
├── docs/                # 문서 통합 폴더
│   └── workflows/       # 플로우차트, 다이어그램
└── PROJECT_HIGHLIGHTS.md # PM 성과 상세 (의사결정 사례 포함)
```

### 주요 문서 (PM이 작성한 기획 산출물)
- [**1차개발 통합 README**](./1차개발/README.md) - 프로젝트 전체 개요
- [**API 명세서**](./1차개발/모두의핏_1차개발_API명세서.md) - 50+ 엔드포인트
- [**IA 명세서**](./1차개발/모두의핏_1차개발_IA명세서.md) - 정보 구조 설계
- [**회원가입 플로우**](./docs/workflows/모두의핏_통합회원가입_플로우.md) - Mermaid 다이어그램
- [**PM 성과 하이라이트**](./PROJECT_HIGHLIGHTS.md) - 의사결정 및 성과

---

## 💼 PM 성과 요약

### 문서화
✅ **6,000+ 라인** 기획 문서 작성  
✅ **4개 역할별** 기능명세서 (일반/운영자/지도자/관리자)  
✅ **50+ API 엔드포인트** 설계  

### 의사결정
✅ **멀티 롤 아키텍처** 설계 결정 → 차별화 포인트 확보  
✅ **BaaS(Supabase) 선택** → 개발 속도 2배 향상  
✅ **승인 프로세스 도입** → 플랫폼 신뢰도 확보  

### 협업
✅ **개발팀과 긴밀한 소통** → 기획 변경 최소화  
✅ **명확한 문서화** → 개발 불확실성 감소  
✅ **Technical PM 역량** → 기술적 의사결정 참여  

---

## 🚀 향후 계획 (Roadmap)

### Phase 2 (예정)
- 찜 기능 고도화
- 예약 시스템 구현
- 결제 연동 (PG 사업자 선정 진행 중)

### Phase 3 (계획)
- AI 기반 시설/지도자 추천
- 운동 일지 및 챌린지 기능
- 소셜 기능 강화 (친구, 그룹 운동)

---

## 📄 License

이 프로젝트는 **PM 포트폴리오** 목적으로 작성되었습니다.  
자세한 내용은 [LICENSE.md](./LICENSE.md)를 참고하세요.

---

**Managed by NEXUSCORE PM Team (Kim Jin-seok & Kim Jeong-chan)**  
*더 나은 운동 환경을 만들어갑니다* 🏋️‍♀️
