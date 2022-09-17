# Classroom 33 PJ - Projector

A new Flutter project.

## 遷移

- Projectorの選択

### [Projectorの場合]

-> stateの判別

- `waiting`
  問答無用で待機画面
- `running`
  1. userIdからUserModelを取得
  2. 自分が対象となる大問IDを確認
  3. 大問データを取得
  4. タイマー開始

## Build時のメモ

```
msvcp140.dll
vcruntime140.dll
vcruntime140_1.dll
```

を`C:\Windows\System32`から引っ張ってくる

```
Release
├ data(フォルダー)
├ flutter_windows.dll
├ msvcp140.dll
├ myapp.exe
├ vcruntime140.dll
├ vcruntime140_1.dll
└ プラグインのdll(パッケージをインストールしていなければ無い)
```

## STATE

| `DeviceState`(enum) | `AcceptState`(bool) | `user_id`(int?) | 画面     | 備考                             |
|---------------------|---------------------|-----------------|--------|----------------------------------|
| `waiting`           | --                  | --              | 待機     | 待機中(デフォルト)                    |
| `starting`          | `false`             | [int?]              | 待機     | Controllerの承認待ち               |
| `starting`          | `true`              | [int?]              | 待機     | Controllerの承認完了(マスター開始待ち) |
| `running`           | --                  | [null]          | 待機     |                                  |
| `running`           | --                  | [int]           | 出題     | 実行開始                         |
| `emergency`         | --                  | --              | 緊急停止 | 緊急停止                         |
`AcceptState`は`DeviceState`が`waiting`の時のみ参照する
`int?` -> `int` | `null`
