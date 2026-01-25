# GitHub 업로드 가이드

이 문서는 "모두의 핏" 프로젝트를 GitHub에 업로드하는 방법을 안내합니다.

---

## 🚀 기존 GitHub 저장소에 업로드

### 저장소 정보
- **Repository URL**: `https://github.com/Nexuscore-Partner/all4fit_App-Planning.git`
- **Repository Name**: `all4fit_App-Planning`
- **Description**: `모두의 핏 - 운동 시설 통합 플랫폼 PM 포트폴리오`

### 방법 1: 자동화 스크립트 사용 (권장 ⭐)

가장 쉬운 방법입니다. PowerShell에서 다음 명령어를 실행하세요:

```powershell
# 프로젝트 폴더로 이동
cd "c:\Users\jinse\Desktop\박찬진 대표님\모두의 핏"

# 스크립트 실행
.\github-upload.ps1
```

스크립트가 자동으로:
1. Git 초기화
2. 원격 저장소 설정
3. 파일 추가 및 커밋
4. GitHub에 푸시

를 수행합니다. 화면에 나오는 안내에 따라 진행하세요.

---

### 방법 2: 수동 명령어 입력

프로젝트 폴더에서 다음 명령어를 실행하세요:

```bash
# Git 초기화
git init

# 모든 파일 추가 (.gitignore에 지정된 파일 제외)
git add .

# 첫 번째 커밋
git commit -m "docs: PM 포트폴리오 프로젝트 재정리 및 문서 개선

- README.md 개선 (기존 GitHub 스타일 유지)
- PROJECT_HIGHLIGHTS.md 추가 (PM 성과 하이라이트)
- 6,000+ 라인 기획 문서 정리
- 불필요한 파일 삭제 및 구조 개선"

# GitHub 원격 저장소 연결
git remote add origin https://github.com/Nexuscore-Partner/all4fit_App-Planning.git

# main 브랜치로 푸시
git branch -M main
git push -u origin main
```

**중요**: 기존 저장소에 이미 파일이 있는 경우, 다음 명령어를 사용하세요:

```bash
# 기존 저장소 내용을 가져온 후 병합
git pull origin main --allow-unrelated-histories

# 충돌이 발생하면 해결 후 다시 커밋
git add .
git commit -m "docs: 기존 저장소와 병합"

# 푸시
git push -u origin main
```

또는 **완전히 새로 시작**하고 싶다면:

```bash
# 강제 푸시 (기존 내용 덮어쓰기)
git push -u origin main --force
```

### 3. 저장소 설정 (선택사항)

GitHub 저장소 페이지에서:

1. **About** 섹션 편집:
   - Description: `🏋️ 모두의 핏 - 운동 시설 통합 플랫폼 PM 포트폴리오`
   - Website: (있다면 추가)
   - Topics: `pm-portfolio`, `product-management`, `fitness-app`, `react-native`, `mongodb`

2. **Repository settings**:
   - Features: Wikis, Issues, Projects 활성화 (선택)

---

## 📊 GitHub Pages 설정 (선택사항)

README.md를 웹페이지로 보여주고 싶다면:

1. Settings → Pages
2. Source: `Deploy from a branch`
3. Branch: `main`, Folder: `/(root)`
4. Save

---

## 🎯 추천 Repository Topics

GitHub 검색 최적화를 위한 추천 태그:

```
pm-portfolio
product-management
product-manager
fitness-app
health-tech
react-native
mongodb
api-documentation
feature-specification
ux-design
```

---

## 📝 커밋 메시지 가이드

앞으로 업데이트 시 권장 커밋 메시지 형식:

```bash
# 문서 추가
git commit -m "docs: 2차 개발 기능명세서 추가"

# 문서 수정
git commit -m "docs: API 명세서 업데이트 - 인증 API 추가"

# 파일 정리
git commit -m "chore: 불필요한 임시 파일 삭제"

# README 업데이트
git commit -m "docs: README 프로젝트 개요 보완"
```

---

## 🔒 보안 체크리스트

업로드 전 확인사항:

- [ ] `.env` 파일이 포함되지 않았는지 확인
- [ ] API 키, 비밀번호 등 민감한 정보 제거 확인
- [ ] 개인정보 (전화번호, 주소 등) 포함 여부 확인
- [ ] `.gitignore`가 제대로 작동하는지 확인

---

## 📌 .gitignore 확인

다음 파일들이 자동으로 제외됩니다:

- `.hwp`, `.hwpx` (한글 문서)
- `.xlsx`, `.xls` (엑셀 파일)
- `.mp4`, `.m4a` (미디어 파일)
- `.zip`, `.rar` (압축 파일)
- `~$*` (임시 파일)
- `govtech/` 폴더

---

## 🎨 README 개선 팁

GitHub에서 더 멋지게 보이도록:

1. **뱃지 추가**:
```markdown
![PM](https://img.shields.io/badge/Role-Product%20Manager-blue)
![Status](https://img.shields.io/badge/Status-In%20Development-yellow)
![Platform](https://img.shields.io/badge/Platform-React%20Native-61DAFB?logo=react)
```

2. **목차 추가** (README.md 상단):
```markdown
## 목차
- [프로젝트 개요](#-프로젝트-개요)
- [기술 스택](#-기술-스택)
- [주요 문서](#-주요-문서)
- [핵심 기능](#-핵심-기능)
```

3. **스크린샷 추가**:
   - 플로우차트 이미지
   - 화면 설계서 스크린샷
   - 시스템 아키텍처 다이어그램

---

## 🔗 포트폴리오 링크 활용

이력서나 LinkedIn에 다음과 같이 링크를 추가하세요:

```
📂 모두의 핏 PM 포트폴리오
   → https://github.com/YOUR_USERNAME/all4fit-pm-portfolio
   
   • 4개 역할별 기능명세서 (6,000+ 라인)
   • 완전한 API 명세서 (50+ 엔드포인트)
   • 시스템 아키텍처 설계
```

---

## ❓ FAQ

**Q: Private 저장소로 만들어야 하나요?**  
A: 포트폴리오 목적이라면 Public 권장. 다만 실제 비즈니스 정보가 포함되었다면 Private 고려.

**Q: 파일이 너무 많은데 어떻게 하나요?**  
A: `.gitignore`가 이미 설정되어 있어 핵심 문서만 업로드됩니다.

**Q: README가 너무 길면 문제가 되나요?**  
A: GitHub는 긴 README를 잘 지원합니다. 목차를 추가하면 더 좋습니다.

---

## 📞 도움이 필요하시면

GitHub 사용에 어려움이 있다면:
- [GitHub 공식 가이드](https://docs.github.com/ko)
- [Git 기본 사용법](https://git-scm.com/book/ko/v2)

---

**준비 완료!** 🚀  
위 가이드를 따라 GitHub에 업로드하세요.
