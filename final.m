disp('----------------------------------MATLAB package -----------------------------------------')
disp('                                          Done by: ')
disp('                                                Sneha G(19pw36) & Sakthi S(19pw27)')
disp('**********************Face recognition using viola jones algorithm*******************')
flag=1;
while(flag==1)
    
    disp('Select any one of the option below to perform the face detection')    
    x='\n1.Face from image\n2.Eyes from image\n3.Capturing faces from live video\n4.Exit\nEnter your choice:';

    choice=input(x)
    switch(choice)
        
        case 1
            clear all
            %Detect objects using Viola-Jones Algorithm To detect Face
        
            disp('***********Detecting a face from the given image***********')

            FDetect = vision.CascadeObjectDetector;

            %Read the input image
            I = imread('group.jpg');

            %Returns Bounding Box values based on number of objects
            BB = step(FDetect,I);

            figure,imshow(I);
            hold on
            for i = 1:size(BB,1)
                rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
            end
            title('Face Detection');
            hold off;
            
            disp('Face detected from image !!')
            
        case 2
            %detect Eyes
            disp('***********Detecting an eye from the given image***********')
        
            EyeDetect = vision.CascadeObjectDetector('EyePairBig');

            %Read the input Image
            I = imread('specs.jpg');
            BB=step(EyeDetect,I);
            figure,imshow(I);
            rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
            title('Eyes Detection');
            
            Eyes=imcrop(I,BB);
            figure,imshow(Eyes);
            
        case 3
            clear cam;
            disp('***********Capturing a face from the web cam and storing it in the folder***********')

            cam=webcam;
        
            nof=input('Enter no. of required frames to be captured:');
            count=1;
            while count<=nof
                
                img=snapshot(cam);
                [croppedframe, bboxpaint]=myfacedetect(img);
                imshow(croppedframe);
                if ~isempty(croppedframe)
     
                    filename=strcat('C:\Users\Pikachu\Desktop\cn database piks\',sprintf('%d.png',count))
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
        
        
        case 4
               disp('***********Exiting from the program!***********')

                    flag=0
                    return
         end
   end