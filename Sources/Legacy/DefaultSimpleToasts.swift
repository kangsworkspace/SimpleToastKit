//    VStack {
//        HStack {
//            Text("텍스트가 복사되었습니다.")
//
//            Image(systemName: "document.on.document")
//        }
//            .foregroundStyle(Color.white.opacity(0.9))
//            .padding(.vertical, 8)
//            .padding(.horizontal, 24)
//            .background {
//                Capsule()
//                    .foregroundStyle(Color.black.opacity(0.88))
//            }

//    VStack(alignment: .leading) {
//        HStack {
//            Capsule()
//                .fill(Color.white)
//                .frame(width: 24, height: 24)
//                .padding(.leading, 0)
//                .overlay {
//                    Capsule()
//                        .overlay {
//                            Image("ToastKitImage", bundle: .module)
//                                .resizable()
//                                .clipShape(Capsule())
//                        }
//                }
//
//            VStack {
//                Text("Text Copy but no long text please")
//                    .foregroundStyle(Color.white.opacity(0.9))
//                    .lineLimit(1)
//                    .minimumScaleFactor(0.6)
//            }
//
//            Spacer()
//        }
//    }
//    .frame(width: 260)
//    .padding(.vertical, 6)
//    .padding(.leading, 8)
//    .padding(.trailing, 16)
//    .background {
//        Capsule()
//    }


//    VStack(alignment: .leading) {
//        Text("텍스트 타이틀이에요.")
//            .foregroundStyle(Color.yellow.opacity(0.9))
//            .font(.headline)
//
//        Text("텍스트가 복사되었습니다.")
//            .foregroundStyle(Color.white.opacity(0.9))
//    }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 22)
//        .background {
//            RoundedRectangle(cornerRadius: 12)
//                .foregroundStyle(Color.black.opacity(0.88))
//            //    .frame(width: 300)
//            //  .frame(height: 44)
//        }
//        .fixedSize()