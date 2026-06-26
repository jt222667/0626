%% x1~x7 store actual joint position and velocity
x = {x1, x2, x3, x4, x5, x6, x7};
t = t(:);
jointNames = {'关节1', '关节2', '关节3', '关节4', '关节5', '关节6', '关节7'};

%% ================= 位置跟踪 =================
figure(1)
box on;
for i = 1:7
    subplot(7, 1, i)
    plot(t, q_D(:, i), 'r', 'LineWidth', 2)
    hold on
    plot(t, x{i}(:, 1), 'b', 'LineWidth', 2)
    hold off
    ylabel(jointNames{i})
    if i == 1
        legend('期望轨迹', '实际轨迹')
    end
end
xlabel('时间(s)')


%% ================= 跟踪误差 =================
figure(2)
box on;
hold on
for i = 1:7
    plot(t, q_D(:, i) - x{i}(:, 1), 'LineWidth', 2)
end
hold off
grid on
xlabel('时间(s)')
ylabel('误差(rad)')
legend(jointNames{:})


%% ================= 力矩 =================
figure(3)
box on;
hold on
for i = 1:7
    plot(t, tol(:, i), 'LineWidth', 2)
end
hold off
grid on
xlabel('时间(s)')
ylabel('关节力矩')
legend(jointNames{:})
