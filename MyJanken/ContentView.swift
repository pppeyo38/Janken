import SwiftUI

struct ContentView: View {
  @State var ansNum = -1
  let imgName = ["gu", "choki", "pa"]
  let imgStr = ["グー", "チョキ", "パー"]
  
  var body: some View {
    VStack {
      if ansNum == -1 {
        Text("これからじゃんけんをします")
      } else {
        Image(imgName[ansNum])
          .resizable()
          .aspectRatio(contentMode: .fit)
        Text(imgStr[ansNum])
      }
      Button("じゃんけんをするぞ！"){
        print("タップされたぞ")
        ansNum = Int.random(in: 0...2)
      }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .font(.title)
        .background(Color.pink)
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
