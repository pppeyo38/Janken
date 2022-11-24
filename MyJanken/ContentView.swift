import SwiftUI

struct ContentView: View {
  @State var ansNum = -1
  let imgName = ["gu", "choki", "pa"]
  let imgStr = ["グー", "チョキ", "パー"]
  
  var body: some View {
    VStack {
      Spacer()
      if ansNum == -1 {
        Text("これからじゃんけんをします")
          .padding(.bottom)
      } else {
        Image(imgName[ansNum])
          .resizable()
          .aspectRatio(contentMode: .fit)
        Spacer()
        Text(imgStr[ansNum])
          .padding(.bottom)
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
