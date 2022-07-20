# README

This project is generated with the following command:
```
rails new statementdog-backend-take-home-project --database=sqlite3 -M -C -T --skip-action-mailbox --skip-active-storage --skip-action-text
```

### Features
  - show multi track lists of current user
  - basic actions(create, update title, destroy) of track lists
  - add existing stocks interested into track lists
  - swap serial of track list

### Test with Rspec:
  - stock
  - track list
  - user

---

1. `EncryptionService` 用來加密會員密碼，考量到時間有限，目前先採取把 key 直接設定在 service 內的做法，日後建議再按照環境需要實做 credentials。
ref: https://guides.rubyonrails.org/security.html

2. 可建立種子資料供開發使用，內有 10 支台股，執行以下 command:
```ruby
rails db:seed
```

3. 透過 `TrackList` 的 serial 欄位的值來調整追蹤清單的順序，若配合 js 套件或前端框架實作拖拉功能，可以更符合使用者直覺操作。

4. 在新增股票進追蹤清單時，若股票代號不存在，或是已新增過該股票，以及刪除追蹤清單，目前也是考量時間有限不使用 modal，因此都以 `notice` 在畫面上顯示提示使用者。

5. 這次功能主要為追蹤清單的 CRUD、把有興趣的股票加入清單以及清單排序，以下兩個 model test 驗證功能是否正常:
  - 股票 `Stock`
    - 檢查是否存在/或已刪除
  - 追蹤清單 `TrackList`
    - 建立
    - 順序調整（上移/下移）

  註：Stock model 的 CRUD 與此功能關聯性較低，因此未撰寫相關測試。

6. 會員相關驗證：目前僅測試 email 欄位是否帶入，以及 password 是否符合加密。可以朝向新增驗證 email 是否有符合信箱格式，或者 password 是否需特殊字元與數量限制。