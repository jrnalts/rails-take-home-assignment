# README

This project is generated with the following command:
```
rails new statementdog-backend-take-home-project --database=sqlite3 -M -C -T --skip-action-mailbox --skip-active-storage --skip-action-text
```

---

1. `EncryptionService` 用來加密會員密碼，考量到時間有限，目前先採取把 key 直接設定在 service 內的做法，日後建議再按照環境需要實做 credentials
ref: https://guides.rubyonrails.org/security.html

