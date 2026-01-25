# 모두의 핏 - 전체 프로세스 플로우 (Mermaid)

## 🎯 전체 통합 플로우 다이어그램

```mermaid
flowchart TD
    %% ============= 앱 시작 및 인증 =============
    Start([모두의 핏 앱 시작]) --> AuthCheck{로그인 상태?}
    AuthCheck -->|비로그인| LoginScreen[로그인 화면]
    AuthCheck -->|로그인됨| MainApp[메인 앱]
    
    %% ============= 로그인 옵션들 =============
    LoginScreen --> EmailLogin[이메일 로그인]
    LoginScreen --> PhoneLogin[전화번호 로그인]
    LoginScreen --> SocialLogin[소셜 로그인<br/>구글/카카오/네이버]
    LoginScreen --> SignupChoice[회원가입 선택]
    
    EmailLogin --> LoginValidation{로그인 검증}
    PhoneLogin --> LoginValidation
    SocialLogin --> LoginValidation
    LoginValidation -->|성공| MainApp
    LoginValidation -->|실패| LoginError[로그인 실패] --> LoginScreen
    
    %% ============= 회원가입 프로세스 =============
    SignupChoice --> UserTypeSelect[사용자 타입 선택]
    UserTypeSelect --> GeneralSignup[일반 사용자]
    UserTypeSelect --> TrainerSignup[지도자 신청]
    UserTypeSelect --> OperatorSignup[시설 운영자 신청]
    
    %% === 일반 사용자 회원가입 ===
    GeneralSignup --> GenBasicInfo[기본정보 입력<br/>이름/연락처/이메일]
    GenBasicInfo --> GenInterests[관심종목 선택<br/>축구/농구/테니스 등]
    GenInterests --> GenLocation[활동지역 설정<br/>GPS 기반]
    GenLocation --> GenTerms[약관동의]
    GenTerms --> GenComplete[일반 사용자<br/>가입 완료]
    GenComplete --> MainApp
    
    %% === 지도자 회원가입 ===
    TrainerSignup --> TrainerBasic[지도자 기본정보<br/>이름/연락처/전문종목]
    TrainerBasic --> TrainerCert[자격증 업로드<br/>생활체육지도자 등]
    TrainerCert --> TrainerPortfolio[포트폴리오 작성<br/>프로필/활동사진/소개글]
    TrainerPortfolio --> TrainerService[서비스 정보 설정<br/>레슨요금/활동지역/시간대]
    TrainerService --> TrainerSubmit[지도자 신청 제출]
    TrainerSubmit --> TrainerWaiting[검토 대기]
    
    %% === 시설 운영자 회원가입 ===
    OperatorSignup --> OperatorBasic[운영자 기본정보<br/>대표자명/사업자번호]
    OperatorBasic --> FacilityInfo[시설 정보 입력<br/>시설명/주소/유형]
    FacilityInfo --> FacilitySchedule[운영시간 설정<br/>요일별 운영시간]
    FacilitySchedule --> FacilityDocs[증빙서류 업로드<br/>사업자등록증/시설사진]
    FacilityDocs --> OperatorSubmit[운영자 신청 제출]
    OperatorSubmit --> OperatorWaiting[검토 대기]
    
    %% ============= 관리자 검토 프로세스 =============
    TrainerWaiting --> AdminQueue[관리자 검토 큐]
    OperatorWaiting --> AdminQueue
    
    AdminQueue --> TrainerReview[지도자 검토<br/>서류/자격/신원 확인]
    AdminQueue --> OperatorReview[운영자 검토<br/>사업자/시설/현장 확인]
    
    TrainerReview --> TrainerDecision{지도자 승인?}
    OperatorReview --> OperatorDecision{운영자 승인?}
    
    TrainerDecision -->|승인| TrainerApproved[지도자 승인<br/>계정 활성화]
    TrainerDecision -->|반려| TrainerRejected[반려 - 수정 요청] --> TrainerBasic
    
    OperatorDecision -->|승인| OperatorApproved[운영자 승인<br/>시설 등록 완료]
    OperatorDecision -->|반려| OperatorRejected[반려 - 서류 보완] --> OperatorBasic
    
    TrainerApproved --> MainApp
    OperatorApproved --> MainApp
    
    %% ============= 메인 앱 4개 탭 =============
    MainApp --> HomeTab[홈 탭]
    MainApp --> FacilityTab[운동시설 탭]
    MainApp --> CommunityTab[커뮤니티 탭]
    MainApp --> MyPageTab[마이페이지 탭]
    
    %% ============= 홈 탭 기능들 =============
    HomeTab --> LocationSearch[위치 기반 검색<br/>GPS 위치 확인]
    HomeTab --> TrainerMatching[지도자 매칭<br/>AI 기반 매칭]
    HomeTab --> QuickReservation[빠른 예약<br/>인기 시설]
    
    %% === 지도자 매칭 상세 프로세스 ===
    TrainerMatching --> MatchingPrefs[매칭 선호도 설정<br/>종목/경력/예산/위치]
    MatchingPrefs --> AIMatching[AI 매칭 시스템<br/>알고리즘 분석]
    AIMatching --> MatchingResults[매칭 결과 표시<br/>추천 지도자 목록]
    MatchingResults --> TrainerDetail[지도자 상세 정보<br/>프로필/리뷰/레슨정보]
    TrainerDetail --> MatchingRequest[매칭 신청<br/>메시지/일정/결제]
    MatchingRequest --> MatchingComplete[매칭 완료]
    
    %% ============= 운동시설 탭 기능들 =============
    FacilityTab --> FacilitySearch[시설 검색<br/>종목별/위치별/가격별]
    FacilitySearch --> FacilityList[시설 목록<br/>거리순/평점순/가격순]
    FacilityList --> FacilityDetail[시설 상세 정보<br/>사진/편의시설/요금/리뷰]
    
    %% === 예약 시스템 ===
    FacilityDetail --> ReservationCalendar[예약 캘린더<br/>실시간 예약 현황]
    ReservationCalendar --> TimeSlotSelect[시간대 선택<br/>이용시간/인원/옵션]
    TimeSlotSelect --> PaymentProcess[결제 처리<br/>결제수단/쿠폰/완료]
    PaymentProcess --> ReservationComplete[예약 완료<br/>확인서/QR코드/알림]
    
    %% ============= 커뮤니티 탭 기능들 =============
    CommunityTab --> CommunitySearch[커뮤니티 검색<br/>지역별/종목별/레벨별]
    CommunitySearch --> CommunityList[커뮤니티 목록<br/>인기/신규/추천]
    CommunityList --> CommunityDetail[커뮤니티 상세<br/>정보/멤버/활동내역]
    CommunityDetail --> CommunityJoin[커뮤니티 가입<br/>신청/승인/웰컴]
    
    CommunityJoin --> ChatRoom[채팅방 기능<br/>실시간 채팅/파일공유]
    CommunityJoin --> EventSchedule[모임 일정 관리<br/>생성/참가/후기]
    ChatRoom --> CommunityManagement[커뮤니티 관리]
    EventSchedule --> CommunityManagement
    
    %% ============= 마이페이지 탭 기능들 =============
    MyPageTab --> ProfileManagement[프로필 관리<br/>정보수정/관심종목/지역]
    MyPageTab --> ReservationHistory[예약 내역<br/>현황/기록/결제내역]
    MyPageTab --> FavoritesList[찜 목록<br/>관심시설/지도자/커뮤니티]
    MyPageTab --> CustomerSupport[고객 지원<br/>1:1문의/FAQ/신고]
    MyPageTab --> Settings[설정<br/>알림/개인정보/약관]
    
    %% ============= 알림 시스템 =============
    MainApp --> NotificationSystem[통합 알림 시스템]
    NotificationSystem --> PushNotifications[푸시 알림<br/>예약/매칭/커뮤니티]
    NotificationSystem --> InAppNotifications[인앱 알림<br/>실시간 메시지/공지]
    NotificationSystem --> EmailSMSNotifications[이메일/SMS 알림<br/>중요안내/보안/마케팅]
    
    %% ============= 관리자 시스템 =============
    AdminQueue --> AdminDashboard[관리자 대시보드]
    AdminDashboard --> UserManagement[사용자 관리<br/>회원정보/권한/제재]
    AdminDashboard --> FacilityManagement[시설 관리<br/>승인/수정/모니터링]
    AdminDashboard --> TrainerManagement[지도자 관리<br/>승인/검증/성과]
    AdminDashboard --> ContentModeration[콘텐츠 관리<br/>신고처리/커뮤니티/리뷰]
    AdminDashboard --> AnalyticsReports[분석 및 리포트<br/>통계/매출/성과지표]
    
    %% ============= 스타일 정의 =============
    classDef startEnd fill:#e1f5fe,stroke:#01579b,stroke-width:3px
    classDef decision fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef generalUser fill:#e8f5e8,stroke:#388e3c,stroke-width:2px
    classDef trainer fill:#fff3e0,stroke:#f57c00,stroke-width:2px
    classDef operator fill:#ffebee,stroke:#d32f2f,stroke-width:2px
    classDef admin fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px
    classDef mainFeature fill:#e0f2f1,stroke:#00796b,stroke-width:2px
    classDef notification fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef error fill:#ffebee,stroke:#d32f2f,stroke-width:2px
    classDef success fill:#e8f5e8,stroke:#388e3c,stroke-width:3px
    
    %% ============= 클래스 적용 =============
    class Start,MainApp startEnd
    class AuthCheck,LoginValidation,TrainerDecision,OperatorDecision decision
    class GeneralSignup,GenBasicInfo,GenInterests,GenLocation,GenTerms,GenComplete generalUser
    class TrainerSignup,TrainerBasic,TrainerCert,TrainerPortfolio,TrainerService,TrainerSubmit,TrainerWaiting,TrainerReview,TrainerApproved trainer
    class OperatorSignup,OperatorBasic,FacilityInfo,FacilitySchedule,FacilityDocs,OperatorSubmit,OperatorWaiting,OperatorReview,OperatorApproved operator
    class AdminQueue,AdminDashboard,UserManagement,FacilityManagement,TrainerManagement,ContentModeration,AnalyticsReports admin
    class HomeTab,FacilityTab,CommunityTab,MyPageTab,LocationSearch,TrainerMatching,FacilitySearch,CommunitySearch,ProfileManagement mainFeature
    class NotificationSystem,PushNotifications,InAppNotifications,EmailSMSNotifications notification
    class LoginError,TrainerRejected,OperatorRejected error
    class MatchingComplete,ReservationComplete,CommunityManagement success
```

## 🎯 주요 기능별 상세 플로우

### 1. 지도자 매칭 시스템

```mermaid
flowchart LR
    A[지도자 매칭 시작] --> B[선호도 설정]
    B --> C[종목 선택<br/>축구/농구/테니스]
    B --> D[경력 수준<br/>초급/중급/고급]
    B --> E[예산 범위<br/>시간당 요금]
    B --> F[위치 반경<br/>활동 가능 거리]
    
    C --> G[AI 매칭 시스템]
    D --> G
    E --> G
    F --> G
    
    G --> H[호환성 분석]
    H --> I[매칭 결과 생성]
    I --> J[추천 지도자 목록]
    J --> K[지도자 상세 보기]
    K --> L[매칭 신청]
    L --> M[일정 조율]
    M --> N[결제 및 확정]
```

### 2. 시설 예약 시스템

```mermaid
flowchart LR
    A[시설 예약 시작] --> B[시설 검색]
    B --> C[필터 적용<br/>종목/위치/가격]
    C --> D[시설 목록]
    D --> E[시설 상세]
    E --> F[예약 캘린더]
    F --> G[날짜 선택]
    G --> H[시간대 선택]
    H --> I[인원 수 입력]
    I --> J[추가 옵션<br/>장비 대여 등]
    J --> K[결제 수단 선택]
    K --> L[할인 쿠폰 적용]
    L --> M[결제 완료]
    M --> N[예약 확인서]
    N --> O[QR 코드 생성]
    O --> P[알림 설정]
```

### 3. 커뮤니티 가입 및 활동

```mermaid
flowchart LR
    A[커뮤니티 탭] --> B[커뮤니티 검색]
    B --> C[지역 필터]
    B --> D[종목 필터]
    B --> E[레벨 필터]
    
    C --> F[커뮤니티 목록]
    D --> F
    E --> F
    
    F --> G[커뮤니티 상세]
    G --> H[가입 신청]
    H --> I[관리자 승인 대기]
    I --> J[가입 승인]
    J --> K[환영 메시지]
    K --> L[채팅방 입장]
    K --> M[모임 일정 확인]
    L --> N[실시간 채팅]
    M --> O[모임 참가 신청]
    N --> P[파일 공유]
    O --> Q[모임 참가]
    Q --> R[후기 작성]
```

## 🛠️ 관리자 시스템 플로우

```mermaid
flowchart TD
    A[관리자 로그인] --> B[관리자 대시보드]
    
    B --> C[사용자 관리]
    B --> D[시설 관리]
    B --> E[지도자 관리]
    B --> F[콘텐츠 관리]
    B --> G[분석 리포트]
    
    C --> C1[회원 정보 조회]
    C --> C2[권한 변경]
    C --> C3[제재 처리]
    
    D --> D1[시설 승인/거부]
    D --> D2[시설 정보 수정]
    D --> D3[운영 모니터링]
    
    E --> E1[지도자 승인/거부]
    E --> E2[자격 검증]
    E --> E3[성과 모니터링]
    
    F --> F1[신고 처리]
    F --> F2[커뮤니티 관리]
    F --> F3[리뷰 모니터링]
    
    G --> G1[사용자 통계]
    G --> G2[매출 분석]
    G --> G3[성과 지표]
```

## 📱 사용법

이 mermaid 다이어그램은 다음과 같이 사용할 수 있습니다:

1. **GitHub**: `.md` 파일에 붙여넣으면 자동 렌더링
2. **VS Code**: Mermaid 확장프로그램 설치 후 미리보기
3. **Mermaid Live Editor**: https://mermaid.live/ 에서 바로 확인
4. **Notion, Obsidian** 등: 대부분의 마크다운 에디터에서 지원

모든 모두의 핏 프로세스가 하나의 통합된 플로우로 구성되어 있어서 전체 서비스 구조를 한눈에 파악할 수 있습니다!
