import SwiftUI

struct ContentView: View {
  @State var ansNum = -1 // コンピューターの手
  @State var selNum = -1 // 自分の手
  @State var resultNum = -1 // 結果
  @State var resultText = "" // 戦績の文字列
  @State var userLife = 3 // ユーザライフ
  @State var userHand = [0, 0, 0] // ユーザがどの手を何回出したか
  @State var isViable = true // 自分の出す手でじゃんけん実行可能か
  
  let imgName = ["gu", "choki", "pa"] // 画像名
  let imgStr = ["グー", "チョキ", "パー"] // 自分の手の表示用
  let resultStr = ["勝ち！", "負け…", "引き分け"] // 結果の表示用
  let resultUnit = ["勝", "敗", "分"] // 戦績の表示用
  let tabWL = [[2, 0, 1], [1, 2, 0], [0, 1, 2]] // 対戦表
  
  // 判定および戦績の更新
  func doJanken() {
    isViable = selfOutPutCount(selfHand: selNum)
    if (isViable) {
      ansNum = Int.random(in: 0...2)
      resultNum = tabWL[selNum][ansNum]
      resultText = imgStr[selNum] + "を出しました"
    } else {
      resultText = imgStr[selNum] + "はもう出せません"
    }
    lifeCalc(result: resultNum)
  }
  
  // 手カウント 0→グー 1→チョキ 2→パー
  func selfOutPutCount(selfHand: Int) -> Bool {
    if (userHand[selfHand] < 4) {
      userHand[selfHand] += 1
      return true
    } else {
      return false
    }
  }
  
  // ライフ処理
  func lifeCalc(result: Int) {
    if (result == 0) {
      userLife += 1
    } else if (result == 1) {
      userLife -= 1
    }
  }
  
  var body: some View {
    VStack {
      // ユーザライフ表示
      HStack {
        Image(systemName: "suit.heart.fill")
          .foregroundColor(Color.pink)
          .frame(width: 16.0, height: 16.0)
        Text(String(userLife))
          .font(.title)
      }
      
      Spacer()
      
      // 画像と結果
      if ansNum == -1 {
        // 初期状態
        Text("これからじゃんけんをします")
          .padding(.bottom)
      } else {
        // 画像
        Image(imgName[ansNum])
          .resizable()
          .aspectRatio(contentMode: .fit)
          .rotationEffect(.init(degrees: 180))
        Spacer()
        Image(imgName[selNum])
          .resizable()
          .aspectRatio(contentMode: .fit)
        Spacer()
        // 画像
        Text(resultText)
          .padding(.bottom)
        Text(resultStr[resultNum])
          .font(.title)
      }
      
      // 自分の出す手を決めるボタン
      HStack {
        VStack {
          Button(imgStr[0]){
            selNum = 0
            doJanken()
          }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .font(.title2)
            .background(Color.purple)
            .foregroundColor(Color.white)
          Text(String(userHand[0]) + " / 4")
        }
        VStack {
          Button(imgStr[1]){
            selNum = 1
            doJanken()
          }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .font(.title2)
            .background(Color.purple)
            .foregroundColor(Color.white)
          Text(String(userHand[1]) + " / 4")
        }
        VStack {
          Button(imgStr[2]){
            selNum = 2
            doJanken()
          }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .font(.title2)
            .background(Color.purple)
            .foregroundColor(Color.white)
          Text(String(userHand[2]) + " / 4")
        }
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
