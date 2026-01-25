# 모두의 핏 - 완전한 프로세스 플로우 (Mermaid)

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
    GenBasicInfo --> GenLocation[활동지역 설정<br/>GPS 기반]
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
    
    %% ============= 홈 탭 기능들 (배달의민족 스타일) =============
    HomeTab --> LocationSearch[위치 기반 검색<br/>GPS 위치 확인]
    HomeTab --> SportCategories[스포츠 카테고리<br/>8개 대분류]
    HomeTab --> TrainerMatchingNotice[지도자 매칭<br/>3차 개발 예정]
    HomeTab --> ReservationNotice[시설 예약<br/>2차 개발 예정]
    
    %% === 스포츠 카테고리 8개 대분류 ===
    SportCategories --> BallSports[구기종목<br/>🏀⚽🏐]
    SportCategories --> RacketSports[라켓종목<br/>🏸🏓🎾]
    SportCategories --> MartialArts[격투/무술<br/>🥋🥊⚔️]
    SportCategories --> WaterSports[수상종목<br/>🏊‍♂️⛵🏄‍♂️]
    SportCategories --> Fitness[피트니스<br/>💪🧘‍♀️🏃‍♂️]
    SportCategories --> WinterSports[동계스포츠<br/>⛷️⛸️🛷]
    SportCategories --> GolfLeisure[골프&레저<br/>⛳🧗‍♂️🪂]
    SportCategories --> SpecialSports[체대입시&장애인<br/>🎯♿📚]
    
    %% === 구기종목 세부 분류 ===
    BallSports --> Soccer[축구<br/>⚽]
    BallSports --> Baseball[야구<br/>⚾]
    BallSports --> Futsal[풋살<br/>🏟️]
    BallSports --> Basketball[농구<br/>🏀]
    BallSports --> Bowling[볼링<br/>🎳]
    BallSports --> Billiards[당구<br/>🎱]
    BallSports --> Volleyball[배구<br/>🏐]
    
    %% === 라켓종목 세부 분류 ===
    RacketSports --> Tennis[테니스<br/>🎾]
    RacketSports --> Badminton[배드민턴<br/>🏸]
    RacketSports --> TableTennis[탁구<br/>🏓]
    RacketSports --> Squash[스쿼시<br/>🎾]
    
    %% === 격투/무술 세부 분류 ===
    MartialArts --> Taekwondo[태권도<br/>🥋]
    MartialArts --> Judo[유도<br/>🥋]
    MartialArts --> Boxing[복싱<br/>🥊]
    MartialArts --> Kumdo[검도<br/>⚔️]
    MartialArts --> Fencing[펜싱<br/>🤺]
    MartialArts --> MMA[종합격투기<br/>가라테/킥복싱/합기도/유술/씨름]
    
    %% === 수상종목 세부 분류 ===
    WaterSports --> Swimming[수영<br/>🏊‍♂️]
    WaterSports --> WaterSki[수상스키<br/>🎿]
    WaterSports --> Diving[다이빙<br/>🤿]
    WaterSports --> Surfing[서핑<br/>🏄‍♂️]
    WaterSports --> Yacht[요트<br/>⛵]
    WaterSports --> Rowing[조정<br/>🚣‍♂️]
    WaterSports --> Canoe[카누<br/>🛶]
    
    %% === 피트니스 세부 분류 ===
    Fitness --> Gym[헬스<br/>💪]
    Fitness --> Pilates[필라테스<br/>🧘‍♀️]
    Fitness --> Yoga[요가<br/>🧘‍♀️]
    Fitness --> CrossFit[크로스핏<br/>🏋️‍♂️]
    Fitness --> JumpRope[줄넘기<br/>🪢]
    Fitness --> DanceSport[댄스스포츠<br/>💃]
    
    %% === 동계스포츠 세부 분류 ===
    WinterSports --> IceSkating[빙상<br/>⛸️]
    WinterSports --> Skiing[스키<br/>⛷️]
    WinterSports --> Sledding[썰매<br/>🛷]
    
    %% === 골프&레저 세부 분류 ===
    GolfLeisure --> ScreenGolf[스크린골프<br/>⛳]
    GolfLeisure --> Climbing[클라이밍<br/>🧗‍♂️]
    GolfLeisure --> Gateball[게이트볼<br/>🏌️‍♂️]
    GolfLeisure --> GroundGolf[그라운드 골프<br/>⛳]
    GolfLeisure --> Inline[인라인<br/>🛼]
    GolfLeisure --> Paragliding[페러글라이딩<br/>🪂]
    
    %% === 체대입시&장애인 세부 분류 ===
    SpecialSports --> PhysicalExam[체대입시<br/>📚]
    SpecialSports --> Disabled[장애인<br/>♿]
    
    %% === 세부 종목에서 시설 목록으로 ===
    Soccer --> SportFacilityList[시설 목록<br/>선택된 종목별 시설]
    Baseball --> SportFacilityList
    Futsal --> SportFacilityList
    Basketball --> SportFacilityList
    Bowling --> SportFacilityList
    Billiards --> SportFacilityList
    Volleyball --> SportFacilityList
    Tennis --> SportFacilityList
    Badminton --> SportFacilityList
    TableTennis --> SportFacilityList
    Squash --> SportFacilityList
    Taekwondo --> SportFacilityList
    Judo --> SportFacilityList
    Boxing --> SportFacilityList
    Kumdo --> SportFacilityList
    Fencing --> SportFacilityList
    MMA --> SportFacilityList
    Swimming --> SportFacilityList
    WaterSki --> SportFacilityList
    Diving --> SportFacilityList
    Surfing --> SportFacilityList
    Yacht --> SportFacilityList
    Rowing --> SportFacilityList
    Canoe --> SportFacilityList
    Gym --> SportFacilityList
    Pilates --> SportFacilityList
    Yoga --> SportFacilityList
    CrossFit --> SportFacilityList
    JumpRope --> SportFacilityList
    DanceSport --> SportFacilityList
    IceSkating --> SportFacilityList
    Skiing --> SportFacilityList
    Sledding --> SportFacilityList
    ScreenGolf --> SportFacilityList
    Climbing --> SportFacilityList
    Gateball --> SportFacilityList
    GroundGolf --> SportFacilityList
    Inline --> SportFacilityList
    Paragliding --> SportFacilityList
    PhysicalExam --> SportFacilityList
    Disabled --> SportFacilityList
    
    SportFacilityList --> Phase2Notice[2차 개발 예정<br/>시설 상세/예약 기능]
    
    %% === 지도자 매칭 (3차 개발 예정) ===
    TrainerMatchingNotice --> Phase3Features[3차 개발 기능<br/>AI 매칭/선호도 설정/결제]
    
    %% ============= 운동시설 탭 기능들 (1차: 기본 목록만) =============
    FacilityTab --> BasicFacilityList[기본 시설 목록<br/>이름/주소/연락처만]
    FacilityTab --> FacilitySearch[간단 검색<br/>키워드/지역별]
    
    BasicFacilityList --> FacilityBasicInfo[기본 시설 정보<br/>이름/주소/전화번호/운영시간]
    FacilitySearch --> BasicFacilityList
    
    FacilityBasicInfo --> ReservationPhase2Notice[예약 기능<br/>2차 개발 예정]
    FacilityBasicInfo --> CallFacility[전화 연결<br/>직접 문의]
    
    %% ============= 커뮤니티 탭 기능들 (1차 개발: 전체 채팅방) =============
    CommunityTab --> GlobalChatRoom[모두의 핏 전체 채팅방<br/>통합 커뮤니티]
    CommunityTab --> CommunityInfo[커뮤니티 안내<br/>이용 규칙/공지사항]
    CommunityTab --> DiscordNotice[2차 업데이트 안내<br/>디스코드 연동 예정]
    
    %% === 전체 채팅방 기능 (1차 개발) ===
    GlobalChatRoom --> ChatFeatures[채팅 기능<br/>텍스트/사진/파일]
    GlobalChatRoom --> ChatRules[채팅 규칙<br/>금지어/매너/신고]
    GlobalChatRoom --> ChatModerators[관리자 기능<br/>메시지 관리/사용자 제재]
    
    CommunityInfo --> UsageRules[이용 규칙<br/>채팅 에티켓]
    CommunityInfo --> CommunityNotices[공지사항<br/>운영 안내]
    CommunityInfo --> ContactSupport[문의하기<br/>운영진 연락]
    
    DiscordNotice --> Phase2Features[2차 업데이트 기능<br/>디스코드 연동/세분화된 채널]
    
    %% === 전체 채팅방 세부 기능 ===
    ChatFeatures --> TextMessage[텍스트 메시지<br/>일반 채팅]
    ChatFeatures --> PhotoShare[사진 공유<br/>이미지 업로드]
    ChatFeatures --> LocationShare[위치 공유<br/>운동 장소 정보]
    ChatFeatures --> EmojiReaction[이모지 반응<br/>좋아요/반응]
    
    ChatRules --> BannedWords[금지어 필터<br/>자동 차단]
    ChatRules --> ReportSystem[신고 시스템<br/>부적절한 메시지]
    ChatRules --> ChatEtiquette[채팅 에티켓<br/>매너 가이드]
    
    ChatModerators --> MessageDelete[메시지 삭제<br/>부적절한 내용]
    ChatModerators --> UserWarning[사용자 경고<br/>규칙 위반 시]
    ChatModerators --> UserMute[채팅 금지<br/>일시적 제재]
    ChatModerators --> UserBan[영구 차단<br/>심각한 위반]
    
    %% ============= 마이페이지 탭 기능들 =============
    MyPageTab --> ProfileManagement[프로필 관리<br/>정보수정]
    MyPageTab --> CustomerSupport[고객 지원<br/>1:1문의/FAQ/신고]
    MyPageTab --> Settings[설정<br/>알림/개인정보/약관]
    MyPageTab --> ReservationHistory[예약 내역<br/>현재/과거/취소내역]
    MyPageTab --> FavoritesList[찜 목록<br/>관심시설/지도자/커뮤니티]
    MyPageTab --> PaymentHistory[결제 내역<br/>이용료/환불내역]
    MyPageTab --> ReviewManagement[리뷰 관리<br/>작성한/받은 리뷰]
    MyPageTab --> PointHistory[포인트 내역<br/>적립/사용 내역]
    MyPageTab --> ActivityStats[활동 통계<br/>운동 기록/분석]
    
    %% === 프로필 관리 ===
    ProfileManagement --> ProfileEdit[기본 정보 수정<br/>이름/연락처/이메일]
    ProfileManagement --> ProfilePhoto[프로필 사진<br/>사진 변경/삭제]
    ProfileManagement --> InterestSports[관심 종목<br/>종목 추가/삭제]
    ProfileManagement --> ActivityRegion[활동 지역<br/>선호 지역 설정]
    ProfileManagement --> SkillLevel[실력 수준<br/>종목별 레벨]
    ProfileManagement --> SelfIntroduction[자기소개<br/>간단한 소개글]
    
    %% === 예약 내역 상세 ===
    ReservationHistory --> CurrentReservation[현재 예약<br/>이용 예정]
    ReservationHistory --> PastReservation[이용 완료<br/>지난 예약]
    ReservationHistory --> CancelledReservation[취소된 예약<br/>취소 내역]
    ReservationHistory --> UpcomingReservation[다가오는 예약<br/>이번 주 일정]
    
    CurrentReservation --> ReservationDetail[예약 상세<br/>시설/일시/옵션]
    CurrentReservation --> ReservationCancel[예약 취소<br/>취소 정책 확인]
    CurrentReservation --> ReservationModify[예약 변경<br/>시간/인원 변경]
    CurrentReservation --> DirectionsToFacility[길찾기<br/>시설 위치 안내]
    
    PastReservation --> UsageHistory[이용 기록<br/>상세 내역]
    PastReservation --> WriteReview[리뷰 작성<br/>별점/후기]
    PastReservation --> ReceiptView[영수증 보기<br/>결제 내역]
    PastReservation --> ReReservation[재예약<br/>같은 시설 예약]
    
    CancelledReservation --> CancelReason[취소 사유<br/>취소 내역]
    CancelledReservation --> RefundStatus[환불 현황<br/>환불 진행상태]
    CancelledReservation --> ReBooking[다시 예약<br/>새로운 예약]
    
    %% === 찜 목록 관리 ===
    FavoritesList --> FavoriteFacilities[찜한 시설<br/>관심 운동시설]
    FavoritesList --> FavoriteTrainers[찜한 지도자<br/>관심 지도자]
    FavoritesList --> FavoriteCommunities[찜한 커뮤니티<br/>관심 모임]
    FavoritesList --> FavoriteEvents[찜한 모임<br/>관심 이벤트]
    
    FavoriteFacilities --> FacilityBookmark[시설 바로가기<br/>빠른 예약]
    FavoriteFacilities --> FacilityNotification[알림 설정<br/>할인/이벤트 알림]
    FavoriteTrainers --> TrainerContact[지도자 연락<br/>매칭 신청]
    FavoriteTrainers --> TrainerScheduleCheck[스케줄 확인<br/>예약 가능 시간]
    FavoriteCommunities --> CommunityQuickJoin[모임 바로가기<br/>빠른 가입]
    FavoriteCommunities --> CommunityUpdates[활동 소식<br/>모임 업데이트]
    
    %% === 리뷰 관리 ===
    ReviewManagement --> MyReviews[내가 쓴 리뷰<br/>시설/지도자/모임]
    ReviewManagement --> ReceivedReviews[받은 리뷰<br/>지도자인 경우]
    ReviewManagement --> ReviewReplies[리뷰 답글<br/>응답 관리]
    ReviewManagement --> ReviewStats[리뷰 통계<br/>평점 분석]
    
    MyReviews --> ReviewEdit[리뷰 수정<br/>내용 편집]
    MyReviews --> ReviewDelete[리뷰 삭제<br/>작성 리뷰 삭제]
    ReceivedReviews --> ReplyToReview[답글 작성<br/>리뷰에 응답]
    ReviewStats --> RatingAnalysis[평점 분석<br/>받은 평점 통계]
    
    %% === 고객 지원 ===
    CustomerSupport --> InquiryCreate[1:1 문의<br/>질문/건의사항]
    CustomerSupport --> InquiryHistory[문의 내역<br/>답변 확인]
    CustomerSupport --> FAQ[자주 묻는 질문<br/>FAQ 검색]
    CustomerSupport --> ReportCreate[신고하기<br/>부적절한 콘텐츠]
    CustomerSupport --> HelpCenter[도움말 센터<br/>이용 가이드]
    
    InquiryCreate --> InquiryCategory[문의 유형<br/>서비스/결제/기술/기타]
    InquiryCategory --> InquiryForm[문의 내용 작성<br/>제목/내용/첨부파일]
    InquiryForm --> InquirySubmit[문의 접수<br/>답변 대기]
    InquirySubmit --> InquiryResponse[답변 확인<br/>푸시 알림]
    
    ReportCreate --> ReportCategory[신고 유형 선택<br/>스팸/욕설/사기/기타]
    ReportCategory --> ReportTarget[신고 대상<br/>사용자/시설/커뮤니티]
    ReportTarget --> ReportReason[신고 사유<br/>상세 내용]
    ReportReason --> ReportEvidence[증거 자료<br/>스크린샷/채팅기록]
    ReportEvidence --> ReportSubmit[신고 접수<br/>관리자 검토]
    ReportSubmit --> ReportResult[신고 결과<br/>처리 완료 알림]
    
    %% === 설정 메뉴 ===
    Settings --> NotificationSettings[알림 설정<br/>푸시/SMS/이메일]
    Settings --> PrivacySettings[개인정보 설정<br/>공개범위/보안]
    Settings --> PaymentSettings[결제 설정<br/>결제수단/자동결제]
    Settings --> LocationSettings[위치 설정<br/>GPS/활동지역]
    Settings --> LanguageSettings[언어 설정<br/>한국어/영어]
    Settings --> AppSettings[앱 설정<br/>테마/폰트/화면]
    Settings --> AccountSettings[계정 설정<br/>비밀번호/탈퇴]
    Settings --> VersionInfo[버전 정보<br/>업데이트/이용약관]
    
    NotificationSettings --> PushToggle[푸시 알림 ON/OFF<br/>예약/매칭/커뮤니티]
    NotificationSettings --> SMSToggle[SMS 알림 ON/OFF<br/>중요 알림만]
    NotificationSettings --> EmailToggle[이메일 알림 ON/OFF<br/>주간/월간 리포트]
    NotificationSettings --> QuietHours[방해금지 시간<br/>알림 중단 시간대]
    
    PrivacySettings --> ProfilePrivacy[프로필 공개 설정<br/>전체/친구/비공개]
    PrivacySettings --> ActivityPrivacy[활동 내역 공개<br/>예약/리뷰/커뮤니티]
    PrivacySettings --> LocationPrivacy[위치 정보 설정<br/>위치 추적 허용]
    PrivacySettings --> DataDownload[개인정보 다운로드<br/>내 데이터 받기]
    PrivacySettings --> PasswordChange[비밀번호 변경<br/>보안 강화]
    PrivacySettings --> TwoFactorAuth[2단계 인증<br/>보안 설정]
    
    PaymentSettings --> DefaultPayment[기본 결제수단<br/>카드/간편결제]
    PaymentSettings --> AutoPayment[자동결제 설정<br/>정기 결제]
    PaymentSettings --> PaymentHistory[결제 내역<br/>월별/연간 통계]
    PaymentSettings --> RefundPolicy[환불 정책<br/>취소/환불 규정]
    
    %% ============= 알림 시스템 =============
    MainApp --> NotificationSystem[통합 알림 시스템]
    NotificationSystem --> PushNotifications[푸시 알림<br/>예약/매칭/커뮤니티]
    NotificationSystem --> InAppNotifications[인앱 알림<br/>실시간 메시지/공지]
    NotificationSystem --> EmailSMSNotifications[이메일/SMS 알림<br/>중요안내/보안/마케팅]
    
    PushNotifications --> ReservationAlerts[예약 알림<br/>확정/변경/취소/리마인더]
    PushNotifications --> MatchingAlerts[매칭 알림<br/>신청/승인/거절/완료]
    PushNotifications --> CommunityAlerts[커뮤니티 알림<br/>새글/댓글/모임/공지]
    PushNotifications --> PaymentAlerts[결제 알림<br/>완료/실패/환불]
    PushNotifications --> SystemAlerts[시스템 알림<br/>업데이트/점검/이벤트]
    
    %% ============= 관리자 시스템 =============
    AdminQueue --> AdminDashboard[관리자 대시보드]
    AdminDashboard --> UserManagement[사용자 관리<br/>회원정보/권한/제재]
    AdminDashboard --> FacilityManagement[시설 관리<br/>승인/수정/모니터링]
    AdminDashboard --> TrainerManagement[지도자 관리<br/>승인/검증/성과]
    AdminDashboard --> ContentModeration[콘텐츠 관리<br/>신고처리/커뮤니티/리뷰]
    AdminDashboard --> AnalyticsReports[분석 및 리포트<br/>통계/매출/성과지표]
    AdminDashboard --> SystemManagement[시스템 관리<br/>서버/업데이트/설정]
    
    %% === 사용자 관리 ===
    UserManagement --> UserList[회원 목록<br/>검색/필터/정렬]
    UserManagement --> UserProfile[회원 상세<br/>정보/활동/제재이력]
    UserManagement --> UserRoles[권한 관리<br/>일반/지도자/운영자]
    UserManagement --> UserSanctions[제재 관리<br/>경고/정지/탈퇴]
    UserManagement --> UserStats[회원 통계<br/>가입/활동/이탈]
    
    %% === 시설 관리 ===
    FacilityManagement --> FacilityApproval[시설 승인<br/>신규 등록 검토]
    FacilityManagement --> FacilityEdit[시설 정보 수정<br/>기본정보/사진/요금]
    FacilityManagement --> FacilityMonitoring[운영 모니터링<br/>예약/매출/리뷰]
    FacilityManagement --> FacilitySupport[시설 지원<br/>문의/교육/가이드]
    
    %% === 콘텐츠 관리 ===
    ContentModeration --> ReportReview[신고 검토<br/>신고 내용 심사]
    ContentModeration --> ContentFilter[콘텐츠 필터<br/>자동 필터링]
    ContentModeration --> CommunityManagement[커뮤니티 관리<br/>모니터링/제재]
    ContentModeration --> ReviewModeration[리뷰 관리<br/>부적절 리뷰 처리]
    
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
    classDef payment fill:#fff8e1,stroke:#f9a825,stroke-width:2px
    classDef community fill:#fce4ec,stroke:#c2185b,stroke-width:2px
    
    %% ============= 클래스 적용 =============
    class Start,MainApp startEnd
    class AuthCheck,LoginValidation,TrainerDecision,OperatorDecision,JoinApproval,MatchingApproval,PaymentSuccess decision
    class GeneralSignup,GenBasicInfo,GenLocation,GenTerms,GenComplete generalUser
    class TrainerSignup,TrainerBasic,TrainerCert,TrainerPortfolio,TrainerService,TrainerSubmit,TrainerWaiting,TrainerReview,TrainerApproved,TrainerMatching,TrainerDetail,MatchingRequest trainer
    class OperatorSignup,OperatorBasic,FacilityInfo,FacilitySchedule,FacilityDocs,OperatorSubmit,OperatorWaiting,OperatorReview,OperatorApproved operator
    class AdminQueue,AdminDashboard,UserManagement,FacilityManagement,TrainerManagement,ContentModeration,AnalyticsReports admin
    class HomeTab,FacilityTab,CommunityTab,MyPageTab,LocationSearch,FacilitySearch,ProfileManagement,SportCategories mainFeature
    class BallSports,RacketSports,MartialArts,WaterSports,Fitness,WinterSports,GolfLeisure,SpecialSports,SportFacilityList mainFeature
    class Soccer,Baseball,Futsal,Basketball,Bowling,Billiards,Volleyball,Tennis,Badminton,TableTennis,Squash mainFeature
    class Taekwondo,Judo,Boxing,Kumdo,Fencing,MMA,Swimming,WaterSki,Diving,Surfing,Yacht,Rowing,Canoe mainFeature
    class Gym,Pilates,Yoga,CrossFit,JumpRope,DanceSport,IceSkating,Skiing,Sledding mainFeature
    class ScreenGolf,Climbing,Gateball,GroundGolf,Inline,Paragliding,PhysicalExam,Disabled mainFeature
    class BasicFacilityList,FacilityBasicInfo,CallFacility mainFeature
    class NotificationSystem,PushNotifications,InAppNotifications,EmailSMSNotifications notification
    class LoginError,TrainerRejected,OperatorRejected error
    class TrainerMatchingNotice,ReservationNotice,Phase2Notice,ReservationPhase2Notice,DiscordNotice,Phase2Features,Phase3Features notification
    class GlobalChatRoom,ChatFeatures,ChatRules,ChatModerators,CommunityInfo community
```

## 🎯 핵심 비즈니스 플로우 요약 (기획 업데이트 반영)

### 1. **홈 탭 - 배달의민족 스타일 카테고리 시스템**
```
홈 → 스포츠 카테고리 (8개 대분류) → 세부 종목 선택 → 종목별 시설 목록 → 시설 상세 → 예약
```
**8개 대분류**: 구기종목, 라켓종목, 격투/무술, 수상종목, 피트니스, 동계스포츠, 골프&레저, 체대입시&장애인

### 2. **지도자 매칭 시스템**
```
선호도 설정 → AI 매칭 → 결과 표시 → 상세 정보 → 매칭 신청 → 지도자 응답 → 일정 확정 → 결제 → 완료
```

### 3. **시설 예약 시스템**  
```
카테고리/검색 → 시설 목록 → 상세 → 캘린더 → 시간 선택 → 옵션 → 결제 → 완료 → QR코드
```

### 4. **커뮤니티 (1차 개발 - 간소화)**
```
전체 채팅방 → 실시간 채팅 → 관리자 모니터링 → 신고/제재 시스템
```
*2차 개발: 디스코드 연동으로 고도화 예정*

### 5. **마이페이지 허브**
```
프로필 관리 → 예약/결제 내역 → 찜 목록 → 리뷰 관리 → 고객지원 → 설정
```

## 📋 **개발 로드맵 (수정된 우선순위)**

### **1차 개발 (필수 기능)**
- ✅ **회원가입 3가지 타입** (일반/지도자/시설운영자)
- ✅ **홈 탭 카테고리 시스템** (8개 대분류 → 세부 종목 → 기본 시설 목록)
- ✅ **운동시설 탭** (기본 시설 목록 + 전화 연결)
- ✅ **커뮤니티 전체 채팅방** (통합 채팅 + 관리자 모니터링)
- ✅ **기본 마이페이지** (프로필/설정/고객지원)
- ✅ **관리자 승인 시스템** (지도자/시설운영자 검토)
- ✅ **기본 알림 시스템** (가입승인/채팅 알림)

### **2차 개발 (예약 시스템)**
- 🔄 **시설 예약 및 결제 시스템** (캘린더/결제/QR코드)
- 🔄 **커뮤니티 디스코드 연동** (세분화된 채널/고급 기능)
- 🔄 **고도화된 시설 관리** (리뷰/평점/상세정보)
- 🔄 **예약 관련 알림** (리마인더/변경/취소)

### **3차 개발 (매칭 시스템)**
- 🔮 **지도자 매칭 시스템** (AI 매칭/선호도/결제)
- 🔮 **고급 분석 기능** (사용자 통계/매출 분석)
- 🔮 **개인화 추천** (AI 기반 시설/지도자 추천)
- 🔮 **소셜 기능 확장** (친구/팔로우/그룹 매칭)

## 🎯 **1차 개발 핵심 플로우**

### **회원가입 → 카테고리 탐색 → 기본 정보 확인 → 전화 문의**
```
앱 시작 → 회원가입 → 홈 탭 → 스포츠 카테고리 → 세부 종목 → 시설 목록 → 기본 정보 → 전화 연결
```

### **커뮤니티 채팅**  
```
커뮤니티 탭 → 전체 채팅방 → 실시간 채팅 → 관리자 모니터링
```

이제 **실제 개발 계획에 맞는** 모두의 핏 1차 개발 플로우가 완성되었습니다!
