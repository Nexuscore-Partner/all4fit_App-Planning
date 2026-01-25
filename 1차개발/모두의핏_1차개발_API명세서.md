# 모두의 핏 1차 개발 API 명세서

## 📋 개요
모두의 핏 앱 1차 개발을 위한 RESTful API 명세서

## 🌐 기본 정보

### Base URL
- **개발 환경**: `https://dev-api.everyonesfit.com`
- **스테이징 환경**: `https://staging-api.everyonesfit.com`
- **프로덕션 환경**: `https://api.everyonesfit.com`

### 인증 방식
- **Bearer Token**: `Authorization: Bearer <token>`
- **토큰 만료 시간**: 24시간
- **리프레시 토큰**: 7일

### 공통 응답 형식
```json
{
  "success": true,
  "data": {},
  "message": "요청이 성공적으로 처리되었습니다.",
  "timestamp": "2024-01-01T00:00:00Z"
}
```

### 에러 응답 형식
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "에러 메시지",
    "details": {}
  },
  "timestamp": "2024-01-01T00:00:00Z"
}
```

## 🔐 인증 API

### 1. 통합 로그인
```http
POST /api/auth/login
Content-Type: application/json

{
  "emailOrPhone": "user@example.com",
  "password": "password123"
}
```

**응답**
```json
{
  "success": true,
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "refresh_token_here",
    "user": {
      "id": "user_id",
      "email": "user@example.com",
      "name": "홍길동",
      "nickname": "길동이",
      "userType": "general",
      "profileImage": "https://example.com/profile.jpg"
    },
    "expiresIn": 86400
  }
}
```

### 2. 카카오 로그인
```http
POST /api/auth/kakao
Content-Type: application/json

{
  "accessToken": "kakao_access_token"
}
```

### 3. 회원가입
```http
POST /api/auth/signup
Content-Type: application/json

{
  "userType": "general",
  "name": "홍길동",
  "email": "user@example.com",
  "phone": "010-1234-5678",
  "password": "password123",
  "nickname": "길동이",
  "birthDate": "1990-01-01",
  "gender": "male",
  "location": "서울시 강남구",
  "agreeTerms": true,
  "agreePrivacy": true
}
```

### 4. 비밀번호 찾기
```http
POST /api/auth/forgot-password
Content-Type: application/json

{
  "name": "홍길동",
  "phone": "010-1234-5678"
}
```

### 5. 비밀번호 재설정
```http
POST /api/auth/reset-password
Content-Type: application/json

{
  "token": "reset_token",
  "newPassword": "newpassword123"
}
```

### 6. 토큰 갱신
```http
POST /api/auth/refresh
Content-Type: application/json

{
  "refreshToken": "refresh_token_here"
}
```

### 7. 로그아웃
```http
POST /api/auth/logout
Authorization: Bearer <token>
```

## 👤 사용자 API

### 1. 프로필 조회
```http
GET /api/users/profile
Authorization: Bearer <token>
```

### 2. 프로필 수정
```http
PUT /api/users/profile
Authorization: Bearer <token>
Content-Type: application/json

{
  "nickname": "새로운닉네임",
  "profileImage": "https://example.com/new-profile.jpg"
}
```

### 3. 비밀번호 변경
```http
PUT /api/users/password
Authorization: Bearer <token>
Content-Type: application/json

{
  "currentPassword": "current123",
  "newPassword": "newpassword123"
}
```

### 4. 회원탈퇴
```http
DELETE /api/users/account
Authorization: Bearer <token>
Content-Type: application/json

{
  "password": "current123"
}
```

## 🏢 시설 API

### 1. 시설 검색
```http
GET /api/facilities/search
Authorization: Bearer <token>
```

**쿼리 파라미터**
- `keyword`: 검색 키워드
- `category`: 카테고리 필터
- `lat`: 위도
- `lng`: 경도
- `radius`: 검색 반경 (km)
- `sortBy`: 정렬 기준 (distance, rating, favorite)
- `page`: 페이지 번호
- `limit`: 페이지당 항목 수

**응답**
```json
{
  "success": true,
  "data": {
    "facilities": [
      {
        "id": "facility_id",
        "name": "강남축구장",
        "address": "서울시 강남구 테헤란로 123",
        "category": "구기",
        "subCategory": "축구",
        "operatingHours": "평일 06:00-22:00, 주말 07:00-21:00",
        "contact": "02-1234-5678",
        "images": ["https://example.com/image1.jpg"],
        "rating": 4.5,
        "reviewCount": 120,
        "isFavorite": false,
        "location": {
          "lat": 37.5665,
          "lng": 126.9780
        },
        "distance": 1.2
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 10,
      "totalItems": 100,
      "itemsPerPage": 10
    }
  }
}
```

### 2. 시설 상세 조회
```http
GET /api/facilities/{facilityId}
Authorization: Bearer <token>
```

**응답**
```json
{
  "success": true,
  "data": {
    "id": "facility_id",
    "name": "강남축구장",
    "address": "서울시 강남구 테헤란로 123",
    "category": "구기",
    "subCategory": "축구",
    "operatingHours": "평일 06:00-22:00, 주말 07:00-21:00",
    "contact": "02-1234-5678",
    "description": "최신 시설을 갖춘 실내 축구장입니다.",
    "images": ["https://example.com/image1.jpg"],
    "facilities": ["주차장", "샤워실", "매점"],
    "rules": "실내화 착용 필수, 음식물 반입 금지",
    "location": {
      "lat": 37.5665,
      "lng": 126.9780
    },
    "rating": 4.5,
    "reviewCount": 120,
    "isFavorite": false,
    "operator": {
      "name": "강남축구장",
      "contact": "02-1234-5678"
    },
    "reviews": [
      {
        "id": "review_id",
        "userId": "user_id",
        "userName": "홍길동",
        "rating": 5,
        "content": "시설이 깔끔하고 좋습니다.",
        "images": [],
        "createdAt": "2024-01-01T00:00:00Z",
        "reply": "감사합니다. 더욱 노력하겠습니다."
      }
    ]
  }
}
```

### 3. 시설 카테고리 조회
```http
GET /api/facilities/categories
Authorization: Bearer <token>
```

### 4. 시설 즐겨찾기 추가/제거
```http
POST /api/facilities/{facilityId}/favorite
Authorization: Bearer <token>
Content-Type: application/json

{
  "action": "add" // or "remove"
}
```

## ⭐ 리뷰 API

### 1. 리뷰 작성
```http
POST /api/reviews
Authorization: Bearer <token>
Content-Type: application/json

{
  "facilityId": "facility_id",
  "rating": 5,
  "content": "시설이 깔끔하고 좋습니다.",
  "images": ["https://example.com/review1.jpg"]
}
```

### 2. 리뷰 목록 조회
```http
GET /api/reviews
Authorization: Bearer <token>
```

**쿼리 파라미터**
- `facilityId`: 시설 ID
- `userId`: 사용자 ID
- `page`: 페이지 번호
- `limit`: 페이지당 항목 수

### 3. 리뷰 수정
```http
PUT /api/reviews/{reviewId}
Authorization: Bearer <token>
Content-Type: application/json

{
  "rating": 4,
  "content": "수정된 리뷰 내용",
  "images": ["https://example.com/review2.jpg"]
}
```

### 4. 리뷰 삭제
```http
DELETE /api/reviews/{reviewId}
Authorization: Bearer <token>
```

### 5. 리뷰 신고
```http
POST /api/reviews/{reviewId}/report
Authorization: Bearer <token>
Content-Type: application/json

{
  "reason": "부적절한 내용",
  "description": "구체적인 신고 사유"
}
```

## 💬 커뮤니티 API

### 1. 게시글 목록 조회
```http
GET /api/posts
Authorization: Bearer <token>
```

**쿼리 파라미터**
- `sortBy`: 정렬 기준 (latest, popular, trending)
- `page`: 페이지 번호
- `limit`: 페이지당 항목 수

**응답**
```json
{
  "success": true,
  "data": {
    "posts": [
      {
        "id": "post_id",
        "userId": "user_id",
        "userName": "홍길동",
        "title": "강남 축구장 이용 후기",
        "content": "정말 좋은 시설이었습니다.",
        "images": ["https://example.com/post1.jpg"],
        "likeCount": 15,
        "commentCount": 5,
        "createdAt": "2024-01-01T00:00:00Z",
        "updatedAt": "2024-01-01T00:00:00Z",
        "isLiked": false
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 10,
      "totalItems": 100,
      "itemsPerPage": 10
    }
  }
}
```

### 2. 게시글 작성
```http
POST /api/posts
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "강남 축구장 이용 후기",
  "content": "정말 좋은 시설이었습니다.",
  "images": ["https://example.com/post1.jpg"]
}
```

### 3. 게시글 상세 조회
```http
GET /api/posts/{postId}
Authorization: Bearer <token>
```

### 4. 게시글 수정
```http
PUT /api/posts/{postId}
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "수정된 제목",
  "content": "수정된 내용",
  "images": ["https://example.com/post2.jpg"]
}
```

### 5. 게시글 삭제
```http
DELETE /api/posts/{postId}
Authorization: Bearer <token>
```

### 6. 게시글 좋아요
```http
POST /api/posts/{postId}/like
Authorization: Bearer <token>
Content-Type: application/json

{
  "action": "like" // or "unlike"
}
```

## 💭 댓글 API

### 1. 댓글 작성
```http
POST /api/posts/{postId}/comments
Authorization: Bearer <token>
Content-Type: application/json

{
  "content": "좋은 글이네요!"
}
```

### 2. 댓글 목록 조회
```http
GET /api/posts/{postId}/comments
Authorization: Bearer <token>
```

### 3. 댓글 수정
```http
PUT /api/comments/{commentId}
Authorization: Bearer <token>
Content-Type: application/json

{
  "content": "수정된 댓글 내용"
}
```

### 4. 댓글 삭제
```http
DELETE /api/comments/{commentId}
Authorization: Bearer <token>
```

### 5. 댓글 좋아요
```http
POST /api/comments/{commentId}/like
Authorization: Bearer <token>
Content-Type: application/json

{
  "action": "like" // or "unlike"
}
```

## ❤️ 즐겨찾기 API

### 1. 즐겨찾기 목록 조회
```http
GET /api/favorites
Authorization: Bearer <token>
```

**쿼리 파라미터**
- `page`: 페이지 번호
- `limit`: 페이지당 항목 수

### 2. 즐겨찾기 추가/제거
```http
POST /api/favorites
Authorization: Bearer <token>
Content-Type: application/json

{
  "facilityId": "facility_id",
  "action": "add" // or "remove"
}
```

## 📞 문의 API

### 1. 1:1 문의 작성
```http
POST /api/inquiries
Authorization: Bearer <token>
Content-Type: application/json

{
  "type": "general", // general, facility, technical
  "title": "문의 제목",
  "content": "문의 내용",
  "facilityId": "facility_id" // 시설 관련 문의인 경우
}
```

### 2. 문의 목록 조회
```http
GET /api/inquiries
Authorization: Bearer <token>
```

### 3. 문의 상세 조회
```http
GET /api/inquiries/{inquiryId}
Authorization: Bearer <token>
```

### 4. 문의 답변 (지도자만)
```http
POST /api/inquiries/{inquiryId}/answer
Authorization: Bearer <token>
Content-Type: application/json

{
  "content": "답변 내용"
}
```

## 🗺️ 지도 API

### 1. 근처 시설 조회
```http
GET /api/facilities/nearby
Authorization: Bearer <token>
```

**쿼리 파라미터**
- `lat`: 위도
- `lng`: 경도
- `radius`: 검색 반경 (km)
- `category`: 카테고리 필터

## 🔔 알림 API

### 1. 알림 목록 조회
```http
GET /api/notifications
Authorization: Bearer <token>
```

### 2. 알림 읽음 처리
```http
PUT /api/notifications/{notificationId}/read
Authorization: Bearer <token>
```

### 3. 알림 설정 조회
```http
GET /api/notifications/settings
Authorization: Bearer <token>
```

### 4. 알림 설정 수정
```http
PUT /api/notifications/settings
Authorization: Bearer <token>
Content-Type: application/json

{
  "reviewNotifications": true,
  "commentNotifications": true,
  "postNotifications": false,
  "systemNotifications": true
}
```

## 🖥️ 관리자 웹 API

### 1. 관리자 로그인
```http
POST /api/admin/auth/login
Content-Type: application/json

{
  "email": "admin@example.com",
  "password": "admin123"
}
```

### 2. 대시보드 데이터 조회
```http
GET /api/admin/dashboard
Authorization: Bearer <admin_token>
```

### 3. 사용자 관리

#### 3.1 사용자 목록 조회
```http
GET /api/admin/users
Authorization: Bearer <admin_token>
```

#### 3.2 사용자 상세 조회
```http
GET /api/admin/users/{userId}
Authorization: Bearer <admin_token>
```

#### 3.3 사용자 상태 변경
```http
PUT /api/admin/users/{userId}/status
Authorization: Bearer <admin_token>
Content-Type: application/json

{
  "status": "active" // active, inactive, suspended
}
```

### 4. 시설 관리

#### 4.1 시설 목록 조회
```http
GET /api/admin/facilities
Authorization: Bearer <admin_token>
```

#### 4.2 시설 승인/거부
```http
PUT /api/admin/facilities/{facilityId}/approval
Authorization: Bearer <admin_token>
Content-Type: application/json

{
  "status": "approved", // approved, rejected
  "reason": "승인 사유 또는 거부 사유"
}
```

### 5. 리뷰 관리

#### 5.1 리뷰 목록 조회
```http
GET /api/admin/reviews
Authorization: Bearer <admin_token>
```

#### 5.2 리뷰 삭제
```http
DELETE /api/admin/reviews/{reviewId}
Authorization: Bearer <admin_token>
```

### 6. 문의 관리

#### 6.1 문의 목록 조회
```http
GET /api/admin/inquiries
Authorization: Bearer <admin_token>
```

#### 6.2 문의 상태 변경
```http
PUT /api/admin/inquiries/{inquiryId}/status
Authorization: Bearer <admin_token>
Content-Type: application/json

{
  "status": "answered" // pending, answered, closed
}
```

## 📊 파일 업로드 API

### 1. 이미지 업로드
```http
POST /api/upload/image
Authorization: Bearer <token>
Content-Type: multipart/form-data

file: [이미지 파일]
```

**응답**
```json
{
  "success": true,
  "data": {
    "url": "https://example.com/uploaded-image.jpg",
    "filename": "image_1234567890.jpg"
  }
}
```

### 2. 다중 이미지 업로드
```http
POST /api/upload/images
Authorization: Bearer <token>
Content-Type: multipart/form-data

files: [이미지 파일들]
```

## 🚨 에러 코드

### 공통 에러 코드
- `UNAUTHORIZED` (401): 인증 실패
- `FORBIDDEN` (403): 권한 없음
- `NOT_FOUND` (404): 리소스 없음
- `VALIDATION_ERROR` (400): 입력값 검증 실패
- `INTERNAL_ERROR` (500): 서버 내부 오류

### 인증 관련 에러
- `INVALID_CREDENTIALS`: 잘못된 로그인 정보
- `TOKEN_EXPIRED`: 토큰 만료
- `TOKEN_INVALID`: 유효하지 않은 토큰
- `USER_NOT_FOUND`: 사용자 없음
- `EMAIL_ALREADY_EXISTS`: 이메일 중복

### 비즈니스 로직 에러
- `FACILITY_NOT_FOUND`: 시설 없음
- `REVIEW_ALREADY_EXISTS`: 이미 리뷰 작성됨
- `INSUFFICIENT_PERMISSION`: 권한 부족
- `CONTENT_TOO_LONG`: 내용이 너무 김
- `INVALID_FILE_TYPE`: 지원하지 않는 파일 형식

## 📈 응답 예시

### 성공 응답
```json
{
  "success": true,
  "data": {
    "id": "resource_id",
    "name": "리소스 이름",
    "createdAt": "2024-01-01T00:00:00Z"
  },
  "message": "요청이 성공적으로 처리되었습니다.",
  "timestamp": "2024-01-01T00:00:00Z"
}
```

### 에러 응답
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "입력값이 올바르지 않습니다.",
    "details": {
      "email": "올바른 이메일 형식이 아닙니다.",
      "password": "비밀번호는 8자 이상이어야 합니다."
    }
  },
  "timestamp": "2024-01-01T00:00:00Z"
}
```

## 🔧 개발 가이드라인

### 1. API 버전 관리
- URL 경로에 버전 포함: `/api/v1/`
- 하위 호환성 유지
- 새로운 기능은 새 버전으로 배포

### 2. 인증 및 보안
- 모든 API 요청에 JWT 토큰 포함
- HTTPS 통신 강제
- Rate Limiting 적용
- 입력값 검증 및 Sanitization

### 3. 성능 최적화
- 응답 데이터 압축
- 적절한 캐싱 전략
- 페이지네이션 적용
- 불필요한 데이터 제외

### 4. 에러 처리
- 일관된 에러 응답 형식
- 적절한 HTTP 상태 코드 사용
- 사용자 친화적인 에러 메시지
- 상세한 로깅

이 API 명세서는 모두의 핏 앱의 백엔드 개발과 프론트엔드 연동을 위한 완전한 가이드를 제공합니다.
