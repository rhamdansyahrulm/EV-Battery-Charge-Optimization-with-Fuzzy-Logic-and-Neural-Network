for i = 1:1
    ambient = result_predict{i, 'suhuRuangan'};
    cellInitialTemp = result_predict{i, 'suhuAwalBaterai'};
    t1 = result_predict{i, 't1'};
    t2 = result_predict{i, 't2'};
    t3 = result_predict{i, 't3'};
    t4 = result_predict{i, 't4'};

    cellT_ini = cellInitialTemp * ones(1, Ns * Np); % Initial cell temperature [K]

    sim('fix_simulasi.slx');

    simlog_t = floor(simlog_ee_lithium_pack_DCFC.BEV_DC_charging_port.Controlled_Current_Source.i.series.time);
    delta_sim_time = diff([0; simlog_t]);
    idx = find(delta_sim_time >= 1);

    simlog_SOC_A = simlog_ee_lithium_pack_DCFC.Module1.outputCellSOC.series.values;
    simlog_T_A = simlog_ee_lithium_pack_DCFC.Module1.outputCellTemp.series.values('K');

    last_row_SOC = simlog_SOC_A(end, 1);
    last_row_T = simlog_T_A(end, 1);

    % Update the corresponding cells in result_predict
    result_predict.socReal(i) = last_row_SOC;
    result_predict.tempReal(i) = last_row_T;
    
%    file_name = "result_time_series.xlsx";
 %   sheet = join([result_predict{i, 'variabel'}, "_", result_predict{i, 'suhuRuangan'}, result_predict{i, 'suhuAwalBaterai'}], "");
  %  xlswrite(file_name, series_soc, char(sheet));

    disp(['row-', num2str(i), ' is done']);
end