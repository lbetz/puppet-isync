# frozen_string_literal: true

require 'spec_helper'

describe 'isync' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          src_dir: '/etc/puppetlabs/code/environments',
          servers: [ '192.168.56.61', '192.168.56.62' ],
          dst_dir: '/etc/puppetlabs/code/environments',
          user: 'puppet',
        }
      end

      it { is_expected.to compile }
    end
  end
end
