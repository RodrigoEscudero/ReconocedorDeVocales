plot (CoefCesptrum_SUP, '.')
plot (CoefCesptrum_INF, '.')
plot (m62result, '.')
plot (ctrs, '.')

 plot( ctrsa(:,1),ctrsa(:,2),ctrsa(:,3),ctrsa(:,4),'r.');
 hold on;
 plot( ctrse(:,1),ctrse(:,2),ctrse(:,3),ctrse(:,4),'b.');
 hold on;
 plot( ctrsi(:,1),ctrsi(:,2),ctrsi(:,3),ctrsi(:,4),'g.');
 hold on;
 plot( ctrso(:,1),ctrso(:,2),ctrso(:,3),ctrso(:,4),'y.');
 hold on;
 plot( ctrsu(:,1),ctrsu(:,2),ctrsu(:,3),ctrsu(:,4),'m.');
 hold on;
 plot( Vctrs(:,1),Vctrs(:,2),Vctrs(:,3),Vctrs(:,4),'.');
 hold;
 
 
X = m62result;
  
[idx,crts] = kmeans(X,4);
 figure;
plot(X(Rcentroide==1,1),X(Rcentroide==1,2),X(Rcentroide==1,3),X(Rcentroide==1,4)...
    ,'r.')
hold on
plot(X(Rcentroide==2,1),X(Rcentroide==2,2),X(Rcentroide==2,3),X(Rcentroide==2,4)...
    ,'b.')
plot(X(Rcentroide==3,1),X(Rcentroide==3,2),X(Rcentroide==3,3),X(Rcentroide==3,4)...
    ,'g.')
hold on
plot(X(Rcentroide==4,1),X(Rcentroide==4,2),X(Rcentroide==4,3),X(Rcentroide==4,4)...
    ,'y.')
hold on
plot(X(Rcentroide==5,1),X(Rcentroide==5,2),X(Rcentroide==5,3),X(Rcentroide==5,4)...
    ,'r.')
hold on
plot(X(Rcentroide==6,1),X(Rcentroide==6,2),X(Rcentroide==6,3),X(Rcentroide==6,4)...
    ,'b.')
plot(X(Rcentroide==7,1),X(Rcentroide==7,2),X(Rcentroide==7,3),X(Rcentroide==7,4)...
    ,'g.')
hold on
plot(X(Rcentroide==8,1),X(Rcentroide==8,2),X(Rcentroide==8,3),X(Rcentroide==8,4)...
    ,'y.')
hold on
plot(crts(:,1),crts(:,2),crts(:,3),crts(:,4),'kx')
     
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

X = m62;
opts = statset('Display','final');
[cidx, ctrs] = kmeans(X, 4, 'Distance','city', ...
    'Replicates',5, 'Options',opts);
plot(X(cidx==1,1),X(cidx==1,2),X(cidx==1,3),X(cidx==1,4),X(cidx==1,5),'r.', ...
    X(cidx==2,1),X(cidx==2,2),X(cidx==2,3),X(cidx==2,4),'b.', ...
    X(cidx==3,1),X(cidx==3,2),X(cidx==3,3),X(cidx==3,4),'g.', ...
    X(cidx==4,1),X(cidx==4,2),X(cidx==4,3),X(cidx==4,4),'y.',...
    ctrs(:,1),ctrs(:,2),ctrs(:,3),ctrs(:,4),'kx');


X = [randn(20,2)+ones(20,2); randn(20,2)-ones(20,2)];
opts = statset('Display','final');
[cidx, ctrs] = kmeans(X, 2, 'Distance','city', ...
    'Replicates',5, 'Options',opts);
plot(X(cidx==1,1),X(cidx==1,2),'r.', ...
    X(cidx==2,1),X(cidx==2,2),'b.', ctrs(:,1),ctrs(:,2),'kx');