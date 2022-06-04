close all;
clear;
clc;

table = readtable('./data/500_Person_Gender_Height_Weight_Index.csv');
femaleTable = table(strcmp(table.Gender, 'Female'), :);
maleTable = table(strcmp(table.Gender, 'Male'), :);
femaleMatrix = table2array(femaleTable(:, 2:end));
maleMatrix = table2array(maleTable(:, 2:end));

% weightVsHeight(femaleMatrix, 'female');
% bmiVsHeight(femaleMatrix, 'female');
% bmiWeightVsHeight(femaleMatrix, 'female');

% weightVsHeight(maleMatrix, 'male');
% bmiVsHeight(maleMatrix, 'male');
% bmiWeightVsHeight(maleMatrix, 'male');

% weightVsHeight2();

function weightVsHeight(matrix, gender)
    data = matrix;
    heights = data(:, 1);
    weights = data(:, 2);
    X = weights;
    y = heights;
    mdl = fitlm(X, y);
    plot(mdl);
    title(strcat('Weight vs. height', ' (', gender, ')'));
    xlabel("Weight (kg)");
    ylabel("Height (cm)");
end

function weightVsHeight2()
    data = readmatrix('./data/SOCR-HeightWeight.csv');
    heights = data(:, 2) * 2.54; % in to cm
    weights = data(:, 3) * 0.453592; % lb to kg
    X = weights;
    y = heights;
    mdl = fitlm(X, y);
    plot(mdl);
    title("Weight vs. height 2");
    xlabel("Weight (kg)");
    ylabel("Height (cm)");
end

function bmiVsHeight(matrix, gender)
    data = matrix;
    heights = data(:, 1);
    bmis = data(:, 3);
    X = bmis;
    y = heights;
    mdl = fitlm(X, y);
    plot(mdl);
    title(strcat('BMI vs. height', ' (', gender, ')'));
    xlabel("BMI (1-5)");
    ylabel("Height (cm)");
end

function bmiWeightVsHeight(matrix, gender)
    data = matrix;
    heights = data(:, 1);
    weights = data(:, 2);
    bmis = data(:, 3);
    X = [bmis weights];
    y = heights;
    mdl = fitlm(X, y);
    plot(mdl);
    title(strcat('Weight & BMI vs. height', ' (', gender, ')'));
    xlabel('Adjusted X (Weight & BMI)');
    ylabel("Height (cm)");
end