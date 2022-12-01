import SwiftUI

struct ContentView: View {
  @State var ansNum = -1 // コンピューターの手
  @State var selNum = -1 // 自分の手
  @State var resultNum = -1 // 結果
  @State var wld = [0, 0, 0] // 通算の勝ち・負け・引き分け
  @State var resultText = "" // 戦績の文字列
  
  let imgName = ["gu", "choki", "pa"] // 画像名
  let imgStr = ["グー", "チョキ", "パー"] // 自分の手の表示用
  let resultStr = ["勝ち！", "負け…", "引き分け"] // 結果の表示用
  let resultUnit = ["勝", "敗", "分"] // 戦績の表示用
  let tabWL = [[2, 0, 1], [1, 2, 0], [0, 1, 2]] // 対戦表
  
  var body: some View {
    VStack {
      // 戦績
      Text(resultText)
        .font(.title)
      
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
        Image(imgName[selNum])
          .resizable()
          .aspectRatio(contentMode: .fit)
        // 画像
        Text(resultStr[resultNum])
          .padding(.bottom)
      }
      
      // じゃんけん結果
      Text(resultStr[0])
        .font(.title)
      
      // 自分の出す手を決めるボタン
      HStack {
        Button(imgStr[0]){
          selNum = 0
        }
          .frame(maxWidth: .infinity)
          .frame(height: 80)
          .font(.title2)
          .background(Color.purple)
          .foregroundColor(Color.white)
        Button(imgStr[1]){
          selNum = 1
        }
          .frame(maxWidth: .infinity)
          .frame(height: 80)
          .font(.title2)
          .background(Color.purple)
          .foregroundColor(Color.white)
        Button(imgStr[2]){
          selNum = 1
        }
          .frame(maxWidth: .infinity)
          .frame(height: 80)
          .font(.title2)
          .background(Color.purple)
          .foregroundColor(Color.white)
      }
      
      // リセットボタン
      Button("リセット"){
        
      }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .font(.title2)
        .background(Color.blue)
        .foregroundColor(Color.white)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
