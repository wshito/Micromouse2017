# The evaluation board for the stepping motor driver a3982slb

## The Characteristics of a3982slb stepping motor driver

- The bipolar stepper motors in full- and half-step modes.
- No power-on or off sequencing is required.
- Automatically chooses the decay mode from SLOW DECAY and MIXED DECAY.
- Internal UVLO and thermal shutdown circuitry.
- The output drive capacity of up to 35V and ±2A.
- The logic voltage accepts between 3.0V and 5.5V.

## Files

- `a3982slb_board.pro`: The main project file for KiCAD.
- `a3982slb_board.sch`: KiCAD schematic file.
- `a3982slb_board.kicad_pcb`: KiCAD pcb file.
- `a3982slb_board-cache.lib`: KiCAD cache for parts library.
- `output`: Contains biproducts from the KiCAD project.
   - `a3982slb_board.csv`: Bill of Devices which includes the URLs of shops.
   - `a3982slb_board_Gerber.zip`: Gerber files for [Elecrow](https:www.elecrow.com) or [PCBGOGO](https://www.pcbgogo.com).
   - `board_layout.pdf`


## About the Bill of Devices

In the schematic, R1 which determines the fixed off-time is set 25kΩ.
However, the BOD lists the URL for 30kΩ because I could not find the one with 25kΩ.  This makes the fixed off-time approximately 6.060606us longer and becomes about 36.363636us. 

## Japanese translation

### a3982slb ステッピングモーター・ドライバの特徴

- バイポーラ駆動方式のステッピングモーター・ドライバ．
- ロジック側電源とモーター側電源の ON・OFF シーケンスに制約がない．どちらから先に電源を入れても，また，OFFにしても問題ない．
- ステップ信号を入力するだけで，チョッピング制御の電流減衰モードが SLOW DECAY と MIXED DECAY から自動選択される．
- 電源電圧低下検出保護機能（UVLO）と熱保護機能（TSD）を搭載．
- 出力は 35V，±2.0A まで対応．
- ロジック電源は 3.0 〜 5.5V 対応．

## Files

- `a3982slb_board.pro`: KiCAD用プロジェクトファイル．
- `a3982slb_board.sch`: KiCAD用回路図ファイル．
- `a3982slb_board.kicad_pcb`: KiCAD用基盤レイアウトファイル．
- `a3982slb_board-cache.lib`: KiCAD cache for parts library.
- `output`: KiCADプロジェクトから生成したファイルを格納．
   - `a3982slb_board.csv`: パーツの入手先URLを記したBOD．
   - `a3982slb_board_Gerber.zip`: [Elecrow](https://www.elecrow.com) か [PCBGOGO](https://www.pcbgogo.jp) 用のガーバーファイルのアーカイブ.
   - `board_layout.pdf`: 基盤レイアウト．

### BOD について

回路図では，固定OFF時間を決める R1 は 25kΩ になっているが，部品が見つけられなかったので，BOD では 30kΩ の入手先を記載している．これにより，固定時間が約 6.060606μ 秒長くなり 36.363636μ 秒になる．ちなみに 25kΩなら約 30.30303μ 秒である．

### 使い方

- Logic 電源を 3.3V に設定し，可変抵抗は 0Ω 側最小値にセット．
- 負荷側電源を 9V 〜 11.1V に設定．
- Vbb_Load 側にあるGND は Logic 電源用の GND．Vbb_Logic 側にある GND がモーター電源用 GND．サイドが逆になるので注意．両者は基盤上で1点アースを取っている．
 

