# RTPConnect

The RTPConnect library allows you to read, edit and write RTPConnect files in Ruby.
RTPConnect is a file format used in radiotherapy (e.g. Mosaiq) for export & import
of treatment planning data. The library is written entirely in Ruby and has no
external dependencies.


## INSTALLATION

  gem install rtp-connect


## REQUIREMENTS

* Ruby 1.9.3 (or higher)


## BASIC USAGE

### Load & Include

    require 'rtp-connect'
    include RTP

### Read, modify and write

    # Read file:
    rtp = Plan.read('some_file.rtp')
    # Extract the Patient's Name:
    name = rtp.patient_last_name
    # Modify the Patient's Name:
    rtp.patient_last_name = 'Anonymous'
    # Write to file:
    rtp.write('new_file.rtp')

### Create a new Plan Definition Record from scratch

    # Create the instance:
    rtp = Plan.new
    # Set the Patient's ID attribute:
    rtp.patient_id = '12345'
    # Export the instance to an RTP string (with CRC):
    output = rtp.to_s

### Convert an RTP file to DICOM:

    p = Plan.read('some_file.rtp')
    dcm = p.to_dcm
    dcm.write('rtplan.dcm')

### Log settings

    # Change the log level so that only error messages are displayed:
    RTP.logger.level = Logger::ERROR
    # Setting up a simple file log:
    l = Logger.new('my_logfile.log')
    RTP.logger = l
    # Create a logger which ages logfile daily/monthly:
    RTP.logger = Logger.new('foo.log', 'daily')
    RTP.logger = Logger.new('foo.log', 'monthly')

### Scripts

For more comprehensive and useful examples, check out the scripts folder
which contains various Ruby scripts that intends to show off real world
usage scenarios of the RTPConnect library.

### IRB Tip

When working with the RTPConnect library in irb, you may be annoyed with all
the information that is printed to screen, regardless of your log level.
This is because in irb every variable loaded in the program is
automatically printed to the screen. A useful hack to avoid this effect is
to append ";0" after a command.

Example:

    rtp = Plan.read('some_file.rtp') ;0


## RESOURCES

* [Rubygems download](https://rubygems.org/gems/rtp-connect)
* [Documentation](http://rubydoc.info/gems/rtp-connect/frames)
* [Source code repository](https://github.com/dicom/rtp-connect)


## RESTRICTIONS

### Supported records

* Plan definition [PLAN_DEF]
* Prescription site [RX_DEF]
* Site setup [SITE_SETUP_DEF]
* Simulation field [SIM_DEF]
* Treatment field [FIELD_DEF]
* Extended treatment field [EXTENDED_FIELD_DEF]
* Control point record [CONTROL_PT_DEF]
* Dose tracking record [DOSE_DEF]

### Unsupported records

* Extended plan definition [EXTENDED_PLAN_DEF]
* Document based treatment field [PDF_FIELD_DEF]
* Multileaf collimator [MLC_DEF]
* MLC shape [MLC_SHAPE_DEF]
* Dose action points [DOSE_ACTION]

If you encounter an RTP file with an unsupported record type, please contact me.


## COPYRIGHT

Copyright 2011-2014 Christoffer Lervåg

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/ .


## ABOUT THE AUTHOR

* Name: Christoffer Lervåg
* Location: Norway
* Email: chris.lervag [@nospam.com] @gmail.com

Please don't hesitate to email me if you have any feedback related to this project!