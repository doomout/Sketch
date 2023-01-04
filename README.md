# 스케치 앱

탭과 터치, 제스처, 그림 그리기 기능을 활용한 손으로 그림 그리기 앱 

사용된 스위프트 문법 

//이미지 뷰 사이즈 만큼 그래픽 시작   
UIGraphicsBeginImageContext(imgView.frame.size)     

//선 색상 지정   
UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)    

//라인의 끝 모양을 라운드로 설정 
UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)  

//선 굵기 지정   
UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)   

//이전에 이동된 위치인 lastPoing 로 시작 위치를 이동시킨다.     
UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoing.x, y: lastPoing.y))    

//lastPoing에서 현재 위치인 currPoint 까지 선을 추가한다.  
UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))     

UIGraphicsGetCurrentContext()?.strokePath()     

//저장한 이미지를 이미지 뷰에 표시 한다.    
imgView.image = UIGraphicsGetImageFromCurrentImageContext()     

//그래픽 종료        
UIGraphicsEndImageContext()     
