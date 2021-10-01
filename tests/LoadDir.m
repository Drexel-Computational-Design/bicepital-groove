function LoadDir()
  % Load user-selected image directory and filter out images
	path = uigetdir();  % Select image directory
	files = dir(path);  % List all files in directory
	files = files(~[files.isdir]); % Remove subdirectories from list
	% Keep only .jpg files
	I = ~cellfun('isempty', regexp({files.name}, '.jpg$'));
	files = files(I);
	% Load all images
	imgs = cell(numel(files), 1);  % preallocate image storage
	for i = 1:numel(files)
		fpath = fullfile(files(i).folder, files(i).name);
		imgs{i} = imread(fpath);
	end
	% Display first image
	ax = uiaxes;
	imagesc(ax, imgs{1})
end