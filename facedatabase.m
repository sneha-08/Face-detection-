clear cam
cam=webcam;
nof=input('Enter no. of required frames:');
count=1;
while count<=nof
    img=snapshot(cam);
    [croppedframe, bboxpaint]=myfacedetect(img);
    imshow(croppedframe);
    if ~isempty(croppedframe)
     
    filename=strcat('C:\Users\Pikachu\Desktop\facedatabase',sprintf('%d.png',count))
    imwrite(croppedframe,filename);
    msg=['Image Acquired No.:',num2str(count)];
    disp(msg)
    count=count+1;
    else
        disp('No face Detected')
    end
    clf('reset')
    pause(0.1)
end
clear cam;