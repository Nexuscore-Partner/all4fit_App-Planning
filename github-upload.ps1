# GitHub Upload Automation Script
# All4Fit PM Portfolio Project

Write-Host "================================" -ForegroundColor Cyan
Write-Host "All4Fit GitHub Upload Script" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# 1. Check Git initialization
if (Test-Path ".git") {
    Write-Host "[INFO] Git repository already initialized." -ForegroundColor Yellow
} else {
    Write-Host "[1/5] Initializing Git repository..." -ForegroundColor Green
    git init
}

# 2. Check and set remote repository
$remoteUrl = "https://github.com/Nexuscore-Partner/all4fit_App-Planning.git"
$existingRemote = git remote get-url origin 2>$null

if ($existingRemote -eq $remoteUrl) {
    Write-Host "[INFO] Remote repository already configured." -ForegroundColor Yellow
} else {
    Write-Host "[2/5] Setting up remote repository..." -ForegroundColor Green
    if ($existingRemote) {
        git remote remove origin
    }
    git remote add origin $remoteUrl
}

# 3. Add files
Write-Host "[3/5] Adding files..." -ForegroundColor Green
git add .

# 4. Commit
Write-Host "[4/5] Creating commit..." -ForegroundColor Green
$commitMessage = @"
docs: PM portfolio optimization and documentation cleanup

- README minimal design applied (330 lines -> 120 lines)
- Strengthened PM/planner perspective
- Updated tech stack (Flutter + Supabase)
- Reorganized documentation structure (docs/workflows folder)
- Removed security files and enhanced .gitignore
"@

git commit -m $commitMessage

# 5. Check branch and push
Write-Host "[5/5] Pushing to GitHub..." -ForegroundColor Green
git branch -M main

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Select Push Method" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host "1. Normal push (merge with existing repo)" -ForegroundColor White
Write-Host "2. Force push (overwrite existing content)" -ForegroundColor White
Write-Host ""
$choice = Read-Host "Choose (1 or 2)"

if ($choice -eq "2") {
    Write-Host ""
    Write-Host "[WARNING] All existing content will be deleted!" -ForegroundColor Red
    $confirm = Read-Host "Are you sure? (yes/no)"
    
    if ($confirm -eq "yes") {
        git push -u origin main --force
        Write-Host ""
        Write-Host "Force push completed!" -ForegroundColor Green
    } else {
        Write-Host "Cancelled." -ForegroundColor Yellow
        exit
    }
} else {
    try {
        git push -u origin main
        Write-Host ""
        Write-Host "Push completed!" -ForegroundColor Green
    } catch {
        Write-Host ""
        Write-Host "[ERROR] Push failed. Conflict with existing repository." -ForegroundColor Red
        Write-Host "Run the following commands to merge:" -ForegroundColor Yellow
        Write-Host "  git pull origin main --allow-unrelated-histories" -ForegroundColor Cyan
        Write-Host "  git push -u origin main" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Or run this script again and choose '2 (Force push)'." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "GitHub Repository URL:" -ForegroundColor Cyan
Write-Host $remoteUrl -ForegroundColor White
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Check it out in your browser!" -ForegroundColor Green

# Wait for script exit
Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
