load handel;
%sound(y, Fs);
len_of_fade = 4;

faded_samples = round(len_of_fade.*Fs);
fade_scale = linspace(0,1,faded_samples)';
y_faded = zeros(length(y),1);
y_faded(1:faded_samples) = y(1:faded_samples).*fade_scale;

deadspace = round(.9.*Fs);
middleNoFade = y(faded_samples:(faded_samples+deadspace));
y_faded_ending = y((faded_samples+deadspace):length(y)).*fade_scale;

sound(y_faded, Fs);