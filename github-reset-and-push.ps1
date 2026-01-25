# GitHub Reset and Clean Push Script
# This will create a clean commit history in English

Write-Host "================================" -ForegroundColor Cyan
Write-Host "Clean Commit History Script" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[WARNING] This will reset your commit history!" -ForegroundColor Red
Write-Host "All previous commits will be replaced with a single clean commit." -ForegroundColor Yellow
Write-Host ""

$confirm = Read-Host "Do you want to continue? (yes/no)"

if ($confirm -ne "yes") {
    Write-Host "Cancelled." -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "[1/6] Removing .git folder..." -ForegroundColor Green
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue

Write-Host "[2/6] Initializing new Git repository..." -ForegroundColor Green
git init

Write-Host "[3/6] Adding all files..." -ForegroundColor Green
git add .

Write-Host "[4/6] Creating clean commit in English..." -ForegroundColor Green
$commitMessage = @"
docs: All4Fit PM Portfolio - Complete Documentation

Project Overview:
- PM portfolio showcasing product management capabilities
- Complete planning documentation for fitness platform app
- 6,000+ lines of detailed product specifications

Key Deliverables:
- Feature specifications for 4 user roles (General/Operator/Coach/Admin)
- 50+ API endpoint specifications
- Information Architecture (IA) design
- User flow diagrams and wireframes
- Database schema and validation rules

Tech Stack:
- Mobile: Flutter (iOS/Android)
- Backend: Supabase (PostgreSQL + Auth)
- Design: Figma (Wireframe, Prototype, Design System)

PM Contributions:
- Product strategy and roadmap planning
- Requirements definition (PRD)
- UX/UI design collaboration
- Development team coordination
- Stakeholder management

Repository Structure:
- /1차개발: Phase 1 development specifications
- /PM: Version-controlled planning documents
- /docs: Consolidated documentation and workflows
"@

git commit -m $commitMessage

Write-Host "[5/6] Setting remote repository..." -ForegroundColor Green
$remoteUrl = "https://github.com/Nexuscore-Partner/all4fit_App-Planning.git"
git remote add origin $remoteUrl

Write-Host "[6/6] Force pushing to GitHub..." -ForegroundColor Green
git branch -M main
git push -u origin main --force

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Success! Clean commit created!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "GitHub Repository URL:" -ForegroundColor Cyan
Write-Host $remoteUrl -ForegroundColor White
Write-Host ""
Write-Host "Your commit history is now clean with English messages only!" -ForegroundColor Green
Write-Host ""

# Wait for script exit
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
