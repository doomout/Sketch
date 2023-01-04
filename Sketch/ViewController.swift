import UIKit

class ViewController: UIViewController {
    var lastPoing : CGPoint! //바로 전에 터치하거나 이동한 위치
    var lineSize : CGFloat = 2.0 //선의 두꼐
    var lineColor = UIColor.red.cgColor //선의 색상
    
    @IBOutlet var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil //이미지 뷰 삭제
    }
    //터치 이벤트 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트를 가져온다.
        
        lastPoing = touch.location(in: imgView) //터치된 위치를 저장한다.
    }
    //터치 이벤트 이동 중
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) //라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch  //현재 발생한 터치 이벤트를 가져온다
        let currPoint = touch.location(in: imgView) //터치된 위치를 저장한다.
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) //이미지 뷰에 있는 이미지를 이미지 크기로 그린다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoing.x, y: lastPoing.y)) //이전에 이동된 위치인 lastPoing 로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) //lastPoing에서 현재 위치인 currPoint 까지 선을 추가한다.
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoing = currPoint //현재 터치된 위치를 할당한다.
    }
    //터치 이벤트 종료
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) //라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch  //현재 발생한 터치 이벤트를 가져온다
        let currPoint = touch.location(in: imgView) //터치된 위치를 저장한다.
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) //이미지 뷰에 있는 이미지를 이미지 크기로 그린다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoing.x, y: lastPoing.y)) //이전에 이동된 위치인 lastPoing 로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) //lastPoing에서 현재 위치인 currPoint 까지 선을 추가한다.
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //사용자가 기기를 흔들었을 때 이미지 뷰 위에 그린 스캐치가 지워지는 함수
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake { //세이크(흔들기)라는 모션이 발생하면.
            imgView.image = nil
        }
    }
}

