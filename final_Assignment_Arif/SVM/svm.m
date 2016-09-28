%% Initialization
clear ; close all; clc

%%Load data
data = load('-ascii' , 'data_banknote_authentication.txt');
sz = size(data,1);
sum_acc = sum_rec = sum_pr = sum_mcc = 0;

begin = time();
for i = 1:5
	%Randomize dataset
	data = data(randperm(sz),:);

	%Create train and test subsets
	train = data(1 : floor(0.7 * sz), :);
	test = data(floor(0.7 * sz) + 1 : end, :);

	%Extract X and y from train dataset
	X_train = double(train(:,1:4));
	y_train = train(:,5); 
		
	X_test = test(:,1:4);
	y_test = test(:,5); 

	model = svmtrain(y_train,X_train,'-s 0 -t 2 -c 1 -h 0');
	[predicted_label, accuracy,dec_values] = svmpredict(y_test,X_test,model);	
	
	%Find out number of true positives,false negatives,etc.
	tp = fp = tn = fn = 0;
	for k = 1:size(y_test,1)	
		if(predicted_label(k,1) == 1 && y_test(k,1) == 1)
			tp += 1;
		elseif(predicted_label(k,1) == 1 && y_test(k,1) == 0)
			fp += 1;
		elseif(predicted_label(k,1) == 0 && y_test(k,1) == 0)
			tn += 1;
		else
			fn += 1;
		endif		
	end	
	
	%Compute precision,recall,mcc
	precision = tp/(tp + fp);
	recall = tp/(tp + fn);	
	mcc = (tp * tn - fp * fn)/sqrt( (tp + fp)*(tp + fn)*(tn + fp)*(tn + fn) );
	
	fprintf('\nAccuracy : %f \n',accuracy(1,1));
	fprintf('\nPrecision : %f',precision);		
	fprintf('\nRecall : %f',recall);
	fprintf('\nMathew''s Correlation Coefficient : %f',mcc);	
	
	sum_acc += accuracy(1,1);
	sum_mcc += mcc;
	sum_pr += precision;
	sum_rec += recall;
	
	fprintf("\nTime taken :: %f \n",time() - begin);
	fprintf("------------------------------------------");
end

fprintf("\nMean accuracy :: %f\n",(sum_acc/5) );
fprintf("\nMean recall :: %f\n",(sum_rec/5) );
fprintf("\nMean precision :: %f\n",(sum_pr/5) );
fprintf("\nMean MCC :: %f\n",(sum_mcc/5) );
