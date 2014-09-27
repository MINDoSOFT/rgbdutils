function R = getRMatrix(yi, yf)
% function R = getRMatrix(yi, yf)
% Generates a rotation matrix that
%   if yf is a scalar, rotates about axis yi by yf degrees
%   if yf is an axis, rotates yi to yf in the direction given by yi x yf

% AUTORIGHTS
  if(isscalar(yf))
    ax = yi./norm(yi);
    phi = yf;
  else
	  yi = yi./norm(yi);
	  yf = yf./norm(yf);
	  ax = cross(yi,yf);
	  ax = ax./norm(ax);
	  %Find angle of rotation
	  phi = acosd(abs(yi'*yf));
  end

	if(abs(phi) > 0.1),
		% ax = cross(yi,yf);
		% ax = ax./norm(ax);
		phi = phi*(pi/180);
		S_hat = [ 0 -ax(3) ax(2); ax(3) 0 -ax(1);-ax(2) ax(1) 0];
		R = eye(3) + sin(phi)*S_hat + (1-cos(phi))*(S_hat^2);
	else
		R = eye(3,3);
	end
end
